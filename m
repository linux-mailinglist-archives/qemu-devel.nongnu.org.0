Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBBE6A75A0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTS1-0008UU-L6; Wed, 01 Mar 2023 15:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTRz-0008UJ-JR
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:53:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTRx-0002xp-Va
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677704000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjTDYOeKCs5FuLQjkGYJPM2s2Xj7JcPSUnwLQHR7N8A=;
 b=DNFN/NlmYm4qVB93NWHoSFyqiA3AvbfZrsH4yZ+yETkT1oQ//5UD53hCSOAlLAaAKXDTpv
 nke5TDNlzUxPusJYWSdCFK7hb1zpULeApD5ypXmEoikwptl5IinSK8AM0Ej2lzEwJokyM7
 6KcOlD7/TSxoUokmhU3ZhxVS4L7eVEQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-USUfDm_ZOw-slba0_E0uBg-1; Wed, 01 Mar 2023 15:53:18 -0500
X-MC-Unique: USUfDm_ZOw-slba0_E0uBg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so181972wms.9
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 12:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677703997;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pjTDYOeKCs5FuLQjkGYJPM2s2Xj7JcPSUnwLQHR7N8A=;
 b=4mNgAk1ksuLBOZN/+nIUQy/J2nZrxkiWou3INkI1E+74ZYCK3nzdWU8xNJb2bmgieq
 qK5X6OC/nqQ/dsad81X+IfyO8jHPpjykk0l9x83QzBf2WNp2iS1QSZmMmOIaPZKf8s7g
 zycpUfmhhhEDB0q9qD0Q6N2Ys+6xHv6u2qd3QqJgqHhNOqPTh3HgDk7n7rsLI235LEqs
 5cxmMevbNtJSkeD1sEf48iDx55AYvpdHkTioCimXiY/gOvhQCFrE3gUOFBDlcHoGbh05
 NJqSdLwN1tzv4aeuRw3IGtzTkS9V0Z5/kNwiKYEdCcPc36XMnuVvFDBmd8+BVVtjrsIW
 8aVQ==
X-Gm-Message-State: AO0yUKW7+7VYtJX359UZ6JOkLJ+uDDOmsS/640+ciUMcNI4XtaTzmdTH
 TwiVyhsx5lAv7EcqChzaNpflSnj/aQHUvUoyOfYdGLU8TiE6XfaJy0DHFrPQ38VDXO4jCs3GkFr
 ipcTOLWDwSoNnMmc=
X-Received: by 2002:adf:f503:0:b0:2c8:50bf:2137 with SMTP id
 q3-20020adff503000000b002c850bf2137mr5345580wro.46.1677703997509; 
 Wed, 01 Mar 2023 12:53:17 -0800 (PST)
X-Google-Smtp-Source: AK7set+95fMO4e496YeRf+3n+mBhjg9LAZnjR1nqbLkzqu/gGg1OfBPX3rfTV015aktV6PP0ByIJ+A==
X-Received: by 2002:adf:f503:0:b0:2c8:50bf:2137 with SMTP id
 q3-20020adff503000000b002c850bf2137mr5345571wro.46.1677703997186; 
 Wed, 01 Mar 2023 12:53:17 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 u4-20020adff884000000b002c70851bfcasm13505351wrp.28.2023.03.01.12.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 12:53:16 -0800 (PST)
Date: Wed, 1 Mar 2023 15:53:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH 4/4] pcie: add trace-point for power indicator transitions
Message-ID: <20230301155249-mutt-send-email-mst@kernel.org>
References: <20230204174758.234951-1-vsementsov@yandex-team.ru>
 <20230204174758.234951-6-vsementsov@yandex-team.ru>
 <1dc32ad1-e52b-f1cd-c176-5844cdba6815@linaro.org>
 <d6ea345b-d3d1-0dfa-20cb-fb328900086a@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6ea345b-d3d1-0dfa-20cb-fb328900086a@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 07, 2023 at 01:39:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Thanks for reviewing!
> 
> On 05.02.23 13:56, Philippe Mathieu-Daudé wrote:
> > On 4/2/23 18:47, Vladimir Sementsov-Ogievskiy wrote:
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > > ---
> > >   hw/pci/pcie.c       | 20 ++++++++++++++++++++
> > >   hw/pci/trace-events |  3 +++
> > >   2 files changed, 23 insertions(+)
> > 
> > > +static const char *pcie_sltctl_pic_str(uint16_t sltctl)
> > > +{
> > > +    switch (sltctl & PCI_EXP_SLTCTL_PIC) {
> > > +    case PCI_EXP_SLTCTL_PWR_IND_ON:
> > > +        return "on";
> > > +    case PCI_EXP_SLTCTL_PWR_IND_BLINK:
> > > +        return "blink";
> > > +    case PCI_EXP_SLTCTL_PWR_IND_OFF:
> > > +        return "off";
> > > +    default:
> > > +        return "?";
> > 
> > Maybe "illegal"?
> 
> I just was unsure about it.
> 
> For SHPC, 0 is correct, and means that this command don't change the led state.
> 
> But with PCI-e hotplug we don't have such commands but change the led directly, so it must be one of "on"/"blink"/"off", and zero is really wrong, right?
> 
> 
> Also, I'm now looking at /* TODO: send event to monitor */ in shpc code, and working on it. So, I think, I'll soon send patches with such event for both SHPC and PCI-e, and probably that trace point becomes not needed.


I think it's ok to queue as is, change it with a patch on top.

> > 
> > Otherwise:
> > 
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > 
> > > +    }
> > > +}
> > 
> 
> -- 
> Best regards,
> Vladimir


