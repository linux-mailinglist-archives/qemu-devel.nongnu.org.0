Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EF350FB97
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:57:35 +0200 (CEST)
Received: from localhost ([::1]:33538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIsw-00065E-Io
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1njIIs-00050g-FF
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1njIIp-0005On-DH
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650968413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IMJGJZpWaU8Z7irkWBRlrIu9nyfQp3I7Gk0FdTg5aQk=;
 b=aHzP1rzu4psGu6G6m7sNJI0iiu+auiv1dtTwit9YvaOeNoxKoPMkef9Gum5Ek4C5DMPSwh
 IpkVIwK9yk4ghJZCl3bYxulhhEMfPdX9lARLrgnAQYxz53KsRbsHSB3oM5zeGliPhlaOce
 LO7ywCTsNecbxUTXrQn/ZZFpYrlUmu4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-2EhIx_KXMrixHxZVKfssow-1; Tue, 26 Apr 2022 06:20:12 -0400
X-MC-Unique: 2EhIx_KXMrixHxZVKfssow-1
Received: by mail-ed1-f72.google.com with SMTP id
 r30-20020a50d69e000000b00425e1e97671so3232106edi.18
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 03:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IMJGJZpWaU8Z7irkWBRlrIu9nyfQp3I7Gk0FdTg5aQk=;
 b=m3+gNcqXFBy8r0sf0RMij/gEO0j7lxo6aSqQUiMg167Aib60bIgE+Txew/qO2d64eN
 zj6BtVVLrkrM0KNvNo635e/TPmJqO9YarDBIjy7Fy83O9WTF5HmEotc/TYw49k46fMGS
 xKXrvinx+5wIUbVTQO3bwHxL3D1w1xfQa7d/RbhSD7UgMbmbNZoPok/ff5uwsPSCjXvc
 4giGI64I4phg7zAN9PgwDVN8HiGAXzuFmbHTQzmFBayLJ0eFWPxYbrfWyRShtHSK7vB4
 +QjhSaYLmAbMB/NYemu0JEw/TpfSe3exmF8Oo3w5KDQo7wsFn3DAq6wdVSw9cZ6emyvP
 X8HA==
X-Gm-Message-State: AOAM5317CiUZC0GHe623rNN/a88aczPV2MyuS4eCt0lIPz0sDzBSXFVE
 iAmObSYoG48nJ7EsMw32nq44kMhid8zyosnPwG9htqQYXP6QSAHexaLXMw119OD7rD+eOhDg64l
 51YK1gGjKqVA17KA=
X-Received: by 2002:a05:6402:2694:b0:423:fd1f:30c2 with SMTP id
 w20-20020a056402269400b00423fd1f30c2mr23629907edd.343.1650968411053; 
 Tue, 26 Apr 2022 03:20:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys8+cb7Q+Zey1kzEKubdyl/Qw+PTwllXk2359hVCvA0OPS7XzS1LbSPN8Jub1HUFefxeUAJA==
X-Received: by 2002:a05:6402:2694:b0:423:fd1f:30c2 with SMTP id
 w20-20020a056402269400b00423fd1f30c2mr23629880edd.343.1650968410829; 
 Tue, 26 Apr 2022 03:20:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a50cbc2000000b00425d7bd65f0sm3921997edi.0.2022.04.26.03.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 03:20:10 -0700 (PDT)
Date: Tue, 26 Apr 2022 12:20:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>, pbonzini@redhat.com
Subject: Re: [PATCH] i386/cpu: Remove the deprecated cpu model 'Icelake-Client'
Message-ID: <20220426122009.011371f3@redhat.com>
In-Reply-To: <7a855b5dc677a832644c08d59bba73e93174cc56.camel@linux.intel.com>
References: <1647247859-4947-1-git-send-email-robert.hu@linux.intel.com>
 <20220324092251.12e01ee6@redhat.com>
 <7a855b5dc677a832644c08d59bba73e93174cc56.camel@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: robert.hu@intel.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Apr 2022 15:07:33 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Thu, 2022-03-24 at 09:22 +0100, Igor Mammedov wrote:
> > On Mon, 14 Mar 2022 16:50:59 +0800
> > Robert Hoo <robert.hu@linux.intel.com> wrote:
> >   
> > > Icelake, is the codename for Intel 3rd generation Xeon Scalable
> > > server
> > > processors. There isn't ever client variants. This "Icelake-Client" 
> > > CPU
> > > model was added wrongly and imaginarily.
> > > 
> > > It has been deprecated since v5.2, now it's time to remove it
> > > completely
> > > from code.
> > > 
> > > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>  
> > 
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Thanks for review, Igor.
> BTW, will this patch be queued? when?

Perhaps Paolo can merge it


