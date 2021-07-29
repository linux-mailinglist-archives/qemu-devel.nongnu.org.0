Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD39E3DA85B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:03:36 +0200 (CEST)
Received: from localhost ([::1]:60586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98VT-0005ag-F4
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m98U8-0003qM-91
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:02:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m98U3-0005yq-IL
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627574525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRiAnUss1J/T4umaPk3d+88IXCFqOqBMCB7K8wiJoEA=;
 b=Fw8YolkZeryM2Vt4n/+fbrglPHITSTAvGmc0gDZM/uE/wmDH5glTopl5zcL03H5vhfpZvj
 F16An/6VdXvXnuScLT2MECNPSsJlrLlUg2kwkKJq67HmkCx6Pnek3ttzdmESP0gQzFpZ5e
 RkpMKqZByuBzhmctqZ7dP8dnyeeREp0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-A-iqUsjnMKKtY5tyTCkJbg-1; Thu, 29 Jul 2021 11:59:51 -0400
X-MC-Unique: A-iqUsjnMKKtY5tyTCkJbg-1
Received: by mail-ej1-f69.google.com with SMTP id
 kq12-20020a170906abccb0290591922761bdso863020ejb.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 08:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nRiAnUss1J/T4umaPk3d+88IXCFqOqBMCB7K8wiJoEA=;
 b=I82I/jd2bOMKhvlV+O5gha04t9/RHoAeBijGErHausbxrz3R+TtaBvMeZPtuAKoCVB
 8Phb4vA36oNSoH8sy93s7BEZCVn7Kv1/7lPHumocSi4NGUVrzR+QZESCW+iR131nFBOs
 hmfSHtKoZaaJ8cD4wlJlPBwV49tiXKdTB/puIKoLmEZcMhg89LHSbIe7OPh/xun3q9l4
 njL1oYyQ4kJwwhyAupCaKW2mp1ZE27KAUGMNwzCTzSLxYaenh7Fvxro7zfK65VvesLy3
 zpVTeguNpKU26qKCEQNBapGFyeUZaeYGIIcqBNbp5BdDAxtkoAXIoiWfZUE6JdGRc1nd
 I2Og==
X-Gm-Message-State: AOAM532//pxpRRAI7PI1wGyPAOsu2TL8BZ7yy3AI9C3M7llwRbpdamU+
 MogcVnCjoeqmvOJ+Xrq1VoIk+kkaM1BTwWGrb4JASc9zJKgHIFjB2JgSAzbKxBNLROSVqfeEIEX
 afT8k3T8x4vE5zGs=
X-Received: by 2002:a05:6402:4cb:: with SMTP id
 n11mr6789782edw.292.1627574390467; 
 Thu, 29 Jul 2021 08:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy1eHwKD4qo8OVkzpVbwAE0slr5M9Tb3ASNjbVm2jKN0RZlXjvDFE/hhgp2Ow9Vj0Btod4tg==
X-Received: by 2002:a05:6402:4cb:: with SMTP id
 n11mr6789754edw.292.1627574390286; 
 Thu, 29 Jul 2021 08:59:50 -0700 (PDT)
Received: from redhat.com ([2.55.154.10])
 by smtp.gmail.com with ESMTPSA id z16sm1373970edr.51.2021.07.29.08.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 08:59:49 -0700 (PDT)
Date: Thu, 29 Jul 2021 11:59:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <20210729115934-mutt-send-email-mst@kernel.org>
References: <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <20210727045315-mutt-send-email-mst@kernel.org>
 <20210727123603.6119c34c@redhat.com>
 <20210728090555-mutt-send-email-mst@kernel.org>
 <CAMj1kXFi43BiaG3pheqDLp_uqFpiS327mMaoc-NOt3HuoS5xsw@mail.gmail.com>
 <80674caa-817a-8be0-2122-fe543ec08a50@roeck-us.net>
 <5de773d1-48c8-1e56-493d-7c94cca78ee7@redhat.com>
 <CAErSpo44E0tnbkjbnvVyUY=6+VUHV51aeXAumYrdmeLOPbPGyg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAErSpo44E0tnbkjbnvVyUY=6+VUHV51aeXAumYrdmeLOPbPGyg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jiahui Cen <cenjiahui@huawei.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 29, 2021 at 09:42:52AM -0500, Bjorn Helgaas wrote:
> On Thu, Jul 29, 2021 at 3:08 AM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
> 
> > Michael, if describing the issue in the revert is too complex, could you
> > include a link to this thread in the revert description?
> > (Message-Id: <20210724185234.GA2265457@roeck-us.net> or
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg826392.html)
> 
> Or https://lore.kernel.org/r/20210724185234.GA2265457@roeck-us.net/,
> which is a convenient, ad-free, long-term, text-only, tools-friendly
> archive maintained by the Linux Foundation.

OK, thanks!

-- 
MST


