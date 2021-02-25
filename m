Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045B3324DAC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:11:50 +0100 (CET)
Received: from localhost ([::1]:55534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDca-0006gF-UT
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFDb7-0005Kj-NP
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:10:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFDb5-00063D-VN
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614247815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8cwDST8a+h82FHST+hvyU9+UX7mqEmawJ8nrvnfYcY=;
 b=AHYGQASVz2TuYpBe4/u5USCCctezcM2GLi9jHtPkSTVExPTKVAdjBSQjFasTweSP5PiZzr
 grcukU9aNA4UfZPvggS3ixQ4JkRKKqO63io5407nWQ/hoxbcPrYcrAkkdRdlMvs2jjMlzL
 Yc7Y8+dUz5m8WACkou0AQJAoztH+kns=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-8sFnkQnmMRW9tQZBs5dARA-1; Thu, 25 Feb 2021 05:10:13 -0500
X-MC-Unique: 8sFnkQnmMRW9tQZBs5dARA-1
Received: by mail-ej1-f70.google.com with SMTP id y3so1967388ejj.20
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b8cwDST8a+h82FHST+hvyU9+UX7mqEmawJ8nrvnfYcY=;
 b=HtaMEUz/Cnee0B8hORD+9I+lb1khqvBhtNthCKmXkZtWIk6gGIrgiCsy6S/mRMql0q
 x4xegZYf2Ni1ERG6dka61ThZZjbB9fL5SsUaoI4X02TmvIG4eID6Jjbd+5GXj1JTi+Dh
 B0N57tkacq5s7jf8nr6uj6so3vdfT5D2HfioCaWXt5/HAor3RhopbIRKcTarKf5HZUdr
 iRT3yS27Kzb9OpceP2oIfZE7uj/ffROU7cVqf6WzSTP/4qRrq+WCkyqNnaU5/8KktFv4
 OsRnBtzYFDN2zUaZwTmJ4B5LdIHy5HSkugJrOuoW00546Myu8Qrx91ez6BsZ/537336D
 n6cQ==
X-Gm-Message-State: AOAM531zq1CjUDqTSAXpzhvytdup+vJ2eh7+jNdaIZ4kR1CV0Hua4WjM
 6IJtjHwn+8XcyY1v/vnFA8BYW/ErF63kKl1lT4R3FJBhEqjNbwea2LNmi/mKviM/bRukWy6AFtJ
 8+3clYOK5qd9rP9M=
X-Received: by 2002:a17:906:7d87:: with SMTP id
 v7mr1982306ejo.214.1614247812368; 
 Thu, 25 Feb 2021 02:10:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3KkueNhyZrAutV9qe3QHCBz4vw5+DL4Bkakcp1ZpKbxriazmyr/p2tnu+gBwAxmIaht51nQ==
X-Received: by 2002:a17:906:7d87:: with SMTP id
 v7mr1982292ejo.214.1614247812190; 
 Thu, 25 Feb 2021 02:10:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v11sm2604957eds.14.2021.02.25.02.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:10:11 -0800 (PST)
Subject: Re: [PATCH v2] char: don't fail when client is not connected
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161284977034.741841.12565530923825663110.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <13d200d7-a5cf-0ad7-40ad-48c06e3f092b@redhat.com>
Date: Thu, 25 Feb 2021 11:10:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161284977034.741841.12565530923825663110.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: marcandre.lureau@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/02/21 06:49, Pavel Dovgalyuk wrote:
> This patch checks that ioc is not null before
> using it in tcp socket tcp_chr_add_watch function.
> 
> The failure occurs in replay mode of the execution,
> when monitor and serial port are tcp servers,
> and there are no clients connected to them:
> 
> -monitor tcp:127.0.0.1:8081,server,nowait
> -serial tcp:127.0.0.1:8082,server,nowait
> 
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   chardev/char-socket.c |    3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 213a4c8dd0..cef1d9438f 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -385,6 +385,9 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
>   static GSource *tcp_chr_add_watch(Chardev *chr, GIOCondition cond)
>   {
>       SocketChardev *s = SOCKET_CHARDEV(chr);
> +    if (!s->ioc) {
> +        return NULL;
> +    }
>       return qio_channel_create_watch(s->ioc, cond);
>   }
>   
> 

Queued, thanks.

Paolo


