Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFEE3D8D64
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 14:01:04 +0200 (CEST)
Received: from localhost ([::1]:45858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8iFD-0001La-8C
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 08:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8iDO-0008Ul-Ft
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:59:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8iDM-0007x4-FX
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627473547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LR+emZYowadv1cLknMACsogmXpIEIYM/HAbKU9Hrq5E=;
 b=gvBvHLkLnXiSWXtwUQNxQd7ZQgaTO4r3NnfUF2/q75+Wyk2Dz90baC1JjsNGgP/YpRLucI
 OeAod4Ax2Iv9s5xSxA6R093lzAMwuywTwfgkKoTjl9xln/vsU2QoJt8ExNAiZ5/k1rNDAX
 sRFv5OGmkJQFEK334Xbdb2dHzoBP4WA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-p_wyk3DOPrmgLo6ap1pbeg-1; Wed, 28 Jul 2021 07:59:01 -0400
X-MC-Unique: p_wyk3DOPrmgLo6ap1pbeg-1
Received: by mail-wr1-f71.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so867590wrl.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 04:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LR+emZYowadv1cLknMACsogmXpIEIYM/HAbKU9Hrq5E=;
 b=Nm5iXq3Qa8DzRmc/igb+NhsNgAaurK2Wl9qCWhnLRZ8wnyGlKFAkCgJHKpUVNLIA+I
 H7Iadf2XVX9hS4QJLV/Z99zCyneMn0tgMh4naA92kotVH21hXylE56SCe5putmOVVsDi
 A9SXx9xTuP5XlhkmtXeAOgl03GAckJDhpW7rtn6JQpF+jJPGzttuVZ7uXvSzGIjEvYJd
 KkHNsFdLQwW31utR81zqzYk30mr2dYvUAiAzAXisRpkmv6biwZ/mT3XFnW8zvL+iUWWw
 FoKHRaj7StICfGZU2AEW5R9mqukDb1WChzc62NUQGCkjP7R2Jwyhvaxd6Ou+B7exn/j7
 3GBA==
X-Gm-Message-State: AOAM530t1zgW18DqE6Y1IXyBkB+2t8J2IOZYOGyC0s49Dz2PxlFP3foA
 V0uv2QnFcXRDBIKRSNa/Pu4i+PLsUJ9mXRdOYsi/6NONddvVFlw+kM89dtxoDEr1iGYgFRNaYvj
 eDEUoN4Nb7KqpM5Y=
X-Received: by 2002:a1c:43c1:: with SMTP id q184mr3287100wma.173.1627473540749; 
 Wed, 28 Jul 2021 04:59:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJQ73c5gkCRZBLqqIKBDEiQpy8Y32DDHwx6fHKNF0J8/gzCpdhTywOiMb5sfEBcUJh1Io4ng==
X-Received: by 2002:a1c:43c1:: with SMTP id q184mr3287089wma.173.1627473540582; 
 Wed, 28 Jul 2021 04:59:00 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id z25sm6051485wmf.9.2021.07.28.04.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:59:00 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 v2] qga-win: Free GMatchInfo properly
To: Konstantin Kostiuk <konstantin@daynix.com>,
 Michael Roth <michael.roth@amd.com>
References: <20210610155811.3313927-1-konstantin@daynix.com>
 <YMI3gundDsLZq1lw@redhat.com>
 <CAJ28CFR0CBAsq4WokeW_OG8gG2UFGSL3H0UB-p2FgXxH3pjhbg@mail.gmail.com>
 <YMI6dP82HBpGM5Bj@redhat.com>
 <CAJ28CFQ6yMm6kCPMY5DckAg1__Qrk+Ar47FNXc5ON6QfvtDmgg@mail.gmail.com>
 <CAJ28CFQFxZxsEcy_3zDK1aLRbX0F2ZaMux8KgcE0thLXzm6kkA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e25c930d-0f46-e138-80fa-b81967c1aad3@redhat.com>
Date: Wed, 28 Jul 2021 13:58:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJ28CFQFxZxsEcy_3zDK1aLRbX0F2ZaMux8KgcE0thLXzm6kkA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Developers <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still candidate for 6.1.

On 7/28/21 9:54 AM, Konstantin Kostiuk wrote:
> ping
> 
> On Wed, Jul 14, 2021 at 10:26 AM Konstantin Kostiuk
> <konstantin@daynix.com <mailto:konstantin@daynix.com>> wrote:
> 
>     CC Michael Roth
> 
>     On Thu, Jun 10, 2021 at 7:14 PM Daniel P. Berrangé
>     <berrange@redhat.com <mailto:berrange@redhat.com>> wrote:
> 
>         On Thu, Jun 10, 2021 at 07:08:36PM +0300, Konstantin Kostiuk wrote:
>         > On Thu, Jun 10, 2021 at 7:02 PM Daniel P. Berrangé
>         <berrange@redhat.com <mailto:berrange@redhat.com>>
>         > wrote:
>         >
>         > > On Thu, Jun 10, 2021 at 06:58:11PM +0300, Kostiantyn Kostiuk
>         wrote:
>         > > > The g_regex_match function creates match_info even if it
>         > > > returns FALSE. So we should always call g_match_info_free.
>         > > > A better solution is using g_autoptr for match_info variable.
>         > > >
>         > > > Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com
>         <mailto:konstantin@daynix.com>>
>         > > > ---
>         > > >  qga/commands-win32.c | 3 +--
>         > > >  1 file changed, 1 insertion(+), 2 deletions(-)
>         > > >
>         > > > diff --git a/qga/commands-win32.c b/qga/commands-win32.c
>         > > > index 300b87c859..785a5cc6b2 100644
>         > > > --- a/qga/commands-win32.c
>         > > > +++ b/qga/commands-win32.c
>         > > > @@ -2494,7 +2494,7 @@ GuestDeviceInfoList
>         *qmp_guest_get_devices(Error
>         > > **errp)
>         > > >              continue;
>         > > >          }
>         > > >          for (j = 0; hw_ids[j] != NULL; j++) {
>         > > > -            GMatchInfo *match_info;
>         > > > +            g_autoptr(GMatchInfo) match_info;
>         > >
>         > > This should be initialized to NULL otherwise...
>         > >
>         > > >              GuestDeviceIdPCI *id;
>         > > >              if (!g_regex_match(device_pci_re, hw_ids[j], 0,
>         > > &match_info)) {
>         > > >                  continue;
>         > >
>         > > this continue will trigger freeing of unintialized memory
>         > >
>         >
>         > But we always call match_info, so match_info is always
>         initialized.
>         > The g_regex_match function creates match_info even if it
>         returns FALSE.
> 
>         Opps, yes, you are right.
> 
>         Reviewed-by: Daniel P. Berrangé <berrange@redhat.com
>         <mailto:berrange@redhat.com>>
> 
> 
>         Regards,
>         Daniel
>         -- 
>         |: https://berrange.com <https://berrange.com>      -o-   
>         https://www.flickr.com/photos/dberrange
>         <https://www.flickr.com/photos/dberrange> :|
>         |: https://libvirt.org <https://libvirt.org>         -o-       
>             https://fstop138.berrange.com <https://fstop138.berrange.com> :|
>         |: https://entangle-photo.org <https://entangle-photo.org>   
>         -o-    https://www.instagram.com/dberrange
>         <https://www.instagram.com/dberrange> :|
> 


