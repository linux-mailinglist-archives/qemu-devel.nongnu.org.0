Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7605B315330
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:51:54 +0100 (CET)
Received: from localhost ([::1]:40722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9VIv-0004mw-I7
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9VBt-0000M1-GW
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:44:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9VBr-00028J-9w
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:44:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612885474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mbNrsPjZeX7AkqM+rmuqiV8bHL/uHlEeN3KhQKTZmk4=;
 b=RSVhbadfuShnX9ncfDS9gq3Tpc9f/gMV26LwATvB1P1FNzY/JlfoQQ5ST3j38WKPLaKO+F
 P749lJaRZJO02oDdZfJjq1s8cB3RVlIOObbGr14JN04ZbAyZWsrtp7AHHtb5vBsiRsYfu5
 u/d28Rw+zOe7nSMEElgjjfnxYTx9DVo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-UviT_GexMKOEF3wVr8IB2w-1; Tue, 09 Feb 2021 10:44:31 -0500
X-MC-Unique: UviT_GexMKOEF3wVr8IB2w-1
Received: by mail-ej1-f70.google.com with SMTP id gv53so8745083ejc.19
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 07:44:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mbNrsPjZeX7AkqM+rmuqiV8bHL/uHlEeN3KhQKTZmk4=;
 b=fRHot0HBVs1N77WyziOTNEXebmCF7weuFHuG5WjnAOEU8vx34QAoI0LiNlVxpCAWjA
 5+AgFexZeq4QsTzY/zOWAAACyLdpSQbk9esFBwjzZLGRGdb1sWQBcsZTn1kkJHTcJ0C0
 lhHdP0sgSL+mRmddODrV4/uEJxuE4HMTK0pIPyxzOEDqi8/8Mu7WbpWwGyARW8Ylraju
 T+Ktd0NIHMKMcdNMj+u4MjJ6cmouxF867BScJqj9rxl+dZxRoVm8E63PyJt2q/VSFDoc
 BccFBU89wKWVwqx/5V/r+oQrVxhflm1gJRPHKDhyWX3JDf5FrocQ6y0vzA3rg86cXGoO
 7d0w==
X-Gm-Message-State: AOAM533DJxXgpOHIhagkxy4EVHCyYzSnwmK4XDofldxeXc6GSJpD+DJl
 8oPsFflVDSEnNduNgrC5tRRqXGY64zsQW0GQosaA3T31CwDb82ZHCTU14jzUs8JIBT8RlfaNuMg
 JzpfBY5AC09rzOZ0=
X-Received: by 2002:a05:6402:b27:: with SMTP id
 bo7mr23247390edb.372.1612885470796; 
 Tue, 09 Feb 2021 07:44:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAV9WPwZ2n1Rz4p2TfmsFl6MBnU39jciWjuy0AhGyFOVhASAUo+gRAljcwBNBXOjjbczyYpg==
X-Received: by 2002:a05:6402:b27:: with SMTP id
 bo7mr23247372edb.372.1612885470547; 
 Tue, 09 Feb 2021 07:44:30 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bd27sm11169795edb.37.2021.02.09.07.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 07:44:29 -0800 (PST)
Subject: Re: [PATCH] scsi: Silence gcc warning
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Alexander Bulekov <alxndr@bu.edu>
References: <20210209152350.207958-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2ca3b005-9d9f-dde6-a7d4-b7e08a3e3066@redhat.com>
Date: Tue, 9 Feb 2021 16:44:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209152350.207958-1-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 4:23 PM, Eric Blake wrote:
> On Fedora 33, gcc 10.2.1 notes that scsi_cdb_length(buf) can set
> len==-1, which in turn overflows g_malloc():
> 
> [5/5] Linking target qemu-system-x86_64
> In function ‘scsi_disk_new_request_dump’,
>     inlined from ‘scsi_new_request’ at ../hw/scsi/scsi-disk.c:2608:9:
> ../hw/scsi/scsi-disk.c:2582:19: warning: argument 1 value ‘18446744073709551612’ exceeds maximum object size 9223372036854775807 [-Walloc-size-larger-than=]
>  2582 |     line_buffer = g_malloc(len * 5 + 1);
>       |                   ^
> 
> Silence it with a decent assertion, since we only convert a buffer to
> bytes when we have a valid cdb length.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  hw/scsi/scsi-disk.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index ed52fcd49ff0..b3311a5657b7 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -2579,6 +2579,7 @@ static void scsi_disk_new_request_dump(uint32_t lun, uint32_t tag, uint8_t *buf)
>      int len = scsi_cdb_length(buf);
>      char *line_buffer, *p;
> 
> +    assert(len > 0 && len <= 16);
>      line_buffer = g_malloc(len * 5 + 1);
> 
>      for (i = 0, p = line_buffer; i < len; i++) {
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


