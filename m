Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BCA3262F5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 13:54:07 +0100 (CET)
Received: from localhost ([::1]:57378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFcdB-00033T-L1
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 07:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFcbW-0002V3-Sw
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 07:52:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFcbS-0003V8-7u
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 07:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614343933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4B3Icw8MwG2DyntGS6jYQaHamFPKLKQjGA5xbW4PSg=;
 b=cSHhs7gxps3M+vrp9bWva3zzUxBJRtBTVWdmNUznix0mqfVZ9BEcmW2cPk1UauDqKe94nh
 pQXckxuEIidqSJm+hKv5U4e8LbQvxGBlUo3RCuvOgWkegDN9TJHjpr9jV5HjJOPRCfbEla
 lKlbWZZzKP1fPl3co6dwQlzNfNx+f8o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-EP5Rcwn7PBCoCXJfPWsSzQ-1; Fri, 26 Feb 2021 07:52:10 -0500
X-MC-Unique: EP5Rcwn7PBCoCXJfPWsSzQ-1
Received: by mail-wm1-f70.google.com with SMTP id v130so3650343wma.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 04:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y4B3Icw8MwG2DyntGS6jYQaHamFPKLKQjGA5xbW4PSg=;
 b=PNycgJlWrLdkOMcrHrdZJc/9HbMyQuK1Mc37FnynEaLuLyUqsYEFryGpgHc5kDpQyR
 he13Q553ub5h0E/X8ABJ4CGge47VyOozKKJuvMnJ4k496SGz5BP/QN8lhTC0o7mDcxkY
 gVGRj+8my88kF2O52GTUGBRVX+GcPNEQGlPqu9AlpxM9pswvAMxHzVjCsE0PkPnirYzn
 wJE/rfAFw//THQE4Wd27PFN1v8JYOoRvyIygZ2tIs6o+vNlVrf0OsdY+8NGuNJTQZKk5
 gltG8ceuKKDo1q9CPCTsG68EJ7k1BnrkDsr8Dc1KFzfM1GKdaZW+nbV06UTW4UtuYgU6
 qSJg==
X-Gm-Message-State: AOAM533s3w1uzamgmS2BC0b8jmll3S0knCfAInh34QRgRW+ACz6BDKDi
 ARNCAouwB7q+00vmkglBCWbe1HRhOQSSvAb0sGXWbRUven0ibi7O35jCb07CUF4KDezP4SBGkTr
 5+5/ptJzMwRN2VxE=
X-Received: by 2002:a5d:524e:: with SMTP id k14mr3146152wrc.9.1614343929008;
 Fri, 26 Feb 2021 04:52:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcu0g/UwrJOw/A6vsyhBsakjsWDtBeWb6q/gjLU++hc9oZiYR7YngMZ9Z+jQq/Z5rrkGF8Ng==
X-Received: by 2002:a5d:524e:: with SMTP id k14mr3146137wrc.9.1614343928843;
 Fri, 26 Feb 2021 04:52:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m17sm11257405wmq.5.2021.02.26.04.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 04:52:08 -0800 (PST)
Subject: Re: [PATCH] net: remove qemu_ether_ntoa()
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210226120607.675753-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <741bba30-a9c3-e87e-3751-6c1f165e8f5c@redhat.com>
Date: Fri, 26 Feb 2021 13:52:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226120607.675753-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-trivial@nongnu.org, jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 1:06 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The function is not thread-safe and sets a bad example. It's used in a
> single place for tracing, so open-code the format string like other
> trace events with MAC addresses.
> 
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu-common.h |  1 -
>  net/announce.c        |  8 +++++++-
>  util/cutils.c         | 13 -------------
>  net/trace-events      |  2 +-
>  4 files changed, 8 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


