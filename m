Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2755A31CFF9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:15:09 +0100 (CET)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC4sN-0006no-Ki
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lC4qv-00060r-Nc
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:13:37 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lC4qt-0005od-Sl
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:13:37 -0500
Received: by mail-pl1-x632.google.com with SMTP id ba1so5948606plb.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 10:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oBCSPMGefpC3Dr1gYrZuSSYaj0mbaw7rDA7NbeIb/iQ=;
 b=DTzHqdC7RZbppVIqoCS09bc9UxXOVavFbv5+/FhQX+uyzY6+QKz1nQ6oT46kkrepqD
 X9P6O5c0bHfj4qbA4oBheQXDeDRaA61RfzfFIBrcNSxo8Ll3K1AFg9e7YU7tZzzres3w
 yPedEYpMmokDBA2C52WoaVQnhmpkBHJvuZR6RLflAjVcOUDLm39CWThyqMqO61yUjTbq
 lefLjLPdwkThEnrFYhKrtlAORk2VytwwtffiOSOuF9VhdwnPjeSYIfh2UN2k0rBkDu3U
 5a8v5v9VbwtdWL+J/DZUwxzsLK1XpELs+Ma/h/GygMPtjS3BdkZx/d/wlDiSCmNc4bEW
 FmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oBCSPMGefpC3Dr1gYrZuSSYaj0mbaw7rDA7NbeIb/iQ=;
 b=Z4K+2Q2gFZyrxnmjyLf6XIldIavf8BwDcBOS1N+z5EzIAB9BcweZKDkVMmpl1CtZVH
 KkcqlcI+N/pVlyNMuNXVw2k3n3F3ClLQ6mi5jFsnStOl+u2ETfN+T1sTtCVkUq1G3mTw
 CYkJrxIo4T84qB7zjAahq78TvEQ0jVix0gyAkbamtEVdk05haAj/bzCqNsuWm2jSNQXr
 bBTtTzeydTPu2KlWgPQYbeRFBCnDY9F/IU6xamCvtr6OrSMTRrqrffrBIt2MW0cXg03y
 ePtGITw6s7upuj/jbwgRbH9ajy+AIXhP7wNuqqYvbpERzgemyeAldnL8/tCfkeo6mWBb
 ZnmA==
X-Gm-Message-State: AOAM532EpAKi3n/nGRzRs2cHn7ZxkDrs5a+4e+xP5IENM5/udefCxq6d
 wbp12/0PW44y4B01qyQWFk4=
X-Google-Smtp-Source: ABdhPJxAkEMp3T2OuOCDamrStlXJi+mCMNxfIgQuVvv7pXYB9LhDaEO3KpyNt2bu2z6i75oiOIcvkg==
X-Received: by 2002:a17:902:ab8f:b029:e1:8334:c845 with SMTP id
 f15-20020a170902ab8fb02900e18334c845mr20834298plr.55.1613499214386; 
 Tue, 16 Feb 2021 10:13:34 -0800 (PST)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id g6sm22153351pfi.15.2021.02.16.10.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 10:13:33 -0800 (PST)
Date: Tue, 16 Feb 2021 10:13:25 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 07/10] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210216181325.GB15303@private.email.ne.jp>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
 <ea43ecd8e920088a783f81a7b2aeee8715657dc6.1613025709.git.isaku.yamahata@intel.com>
 <20210212164038.207e0f54@redhat.com>
 <20210212205157.GA7151@private.email.ne.jp>
 <20210215134832.5a32e851@redhat.com>
 <20210216094301.GA15303@private.email.ne.jp>
 <20210216084510-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Disposition: inline
In-Reply-To: <20210216084510-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Isaku Yamahata <isaku.yamahata@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 08:45:48AM -0500,
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Feb 16, 2021 at 01:43:01AM -0800, Isaku Yamahata wrote:
> > On Mon, Feb 15, 2021 at 01:48:32PM +0100,
> > Igor Mammedov <imammedo@redhat.com> wrote:
> > 
> > > On Fri, 12 Feb 2021 12:51:57 -0800
> > > Isaku Yamahata <isaku.yamahata@gmail.com> wrote:
> > > 
> > > > On Fri, Feb 12, 2021 at 04:40:38PM +0100,
> > > > Igor Mammedov <imammedo@redhat.com> wrote:
> > > > 
> > > > > On Wed, 10 Feb 2021 22:46:43 -0800
> > > > > Isaku Yamahata <isaku.yamahata@intel.com> wrote:
> > > > >   
> > > > > > +    Aml *dev;
> > > > > > +    Aml *rbuf;
> > > > > > +    Aml *resource_template;
> > > > > > +    Aml *rbuf_name;
> > > > > > +    Aml *crs;
> > > > > > +
> > > > > > +    if (!acpi_get_mcfg(&mcfg)) {
> > > > > > +        return NULL;
> > > > > > +    }
> > > > > > +
> > > > > > +    /* DRAM controller */
> > > > > > +    dev = aml_device("DRAC");
> > > > > > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
> > > > > > +
> > > > > > +    resource_template = aml_resource_template();
> > > > > > +    aml_append(resource_template,
> > > > > > +               aml_qword_memory(AML_POS_DECODE,
> > > > > > +                                AML_MIN_FIXED,
> > > > > > +                                AML_MAX_FIXED,
> > > > > > +                                AML_NON_CACHEABLE,
> > > > > > +                                AML_READ_WRITE,
> > > > > > +                                0x0000000000000000,
> > > > > > +                                mcfg.base,
> > > > > > +                                mcfg.base + mcfg.size - 1,  
> > > > > s/mcfg.base + mcfg.size - 1/mcfg.base/  
> > > > 
> > > > AddressMaximum needs to be the highest address of the region.
> > > > Not base address. By disassemble/assembl it, iasl complains as follows.
> > > > Also there are similar examples in acpi-build.c.
> > > I mostly clean up all places to use the same base address for min/max,
> > > but probably something were left behind.
> > > 
> > > spec says:
> > > 
> > > acpi 6.3: 19.6.110 QWordMemory
> > > 
> > > AddressMaximum evaluates to a 64-bit integer that specifies the highest possible base address of the
> > > Memory range. The value must have ‘0’ in all bits where the corresponding bit in AddressGranularity is
> > > ‘1’. For bridge devices which translate addresses, this is the address on the secondary bus. The 64-bit
> > > field DescriptorName ._MAX is automatically created to refer to this portion of the resource descriptor.
> > 
> > Ok, Linux guest is happy with min=max.
> > I conlude that it's iasl issue.
> > 
> > Thanks,
> 
> OK but what about all the other places in the code that seem to use this
> field differently?

Igor, what do you think?
The followings are the summary of the situation.

- acpi 6.4: 19.6.110 QWordMemory
  _MAX: maximum of base address.

- acpi 6.4: 6.4.3.5 Address Space Resource Descriptors
  table 6.44
  If _LEN > 0 and _MIF = 1 and _MAF = 1, then _LEN = _MAX - _MIN + 1
  This doesn't match with the above description

- iasl
  If _LEN > 0 and _MIF = 1 and _MAF = 1,
  it emits warning on _LEN != _MAX - _MIN + 1

- Linux Guest MMCONFIG check 
  check_mcfg_resoure() uses only _MIN. doesn't use _MAX.
  _MAX value doesn't matter

- Linux acpi code
  acpi_decode_space() uses _MAX to calulate range [start, end], not use _LEN.
  i.e. It assumes _LEN = _MAX - _MIN + 1 if _LEN > 0, _MIF = 1, _MAF = 1

- qemu code sets for [qd]word_memory_resource (except this patch)
  If _LEN > 0 and _MIF = 1 and _MAF = 1, then set _LEN = _MAX - _MIN + 1

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

