Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39119412E23
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 07:19:05 +0200 (CEST)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSYBL-0004RU-Oo
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 01:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mSYAN-0003nN-KP
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 01:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mSYAK-000767-21
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 01:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632201477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5CL3Up9iYqgiAMfODj8LNxywVffDHdxKNSxLiOV814=;
 b=S1bemkV56uf2nHXefgu6foHDUSpZ88wEts8ypYyza6/g9kPGZMBJnNu+DrLjISc30fvbIm
 EqpHMk04NtJsbl4jWByvTpruKuzKi1nwmH+BDo6879ZimioSlcvC2X9AFvgC1UEJLcVw5y
 Oyu69Di2O0YyleSMd3bG4y85rOixl2I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-96ebjbLPMv6PyhiUTI8NfQ-1; Tue, 21 Sep 2021 01:17:56 -0400
X-MC-Unique: 96ebjbLPMv6PyhiUTI8NfQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 e1-20020adfa741000000b0015e424fdd01so7370974wrd.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 22:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p5CL3Up9iYqgiAMfODj8LNxywVffDHdxKNSxLiOV814=;
 b=ohe5E4JDZVuwT9Le4JDWtrPFNwJaT0SW5ibRckdf4kY6ZqxM9vwb5cu5u3ZYs/fp9V
 57M7+63ZmD408Xp5IRYrcGqmzSQSpOoQM/w1bnihbzBmwnKHYYXUuKdJIMH1I46HMv39
 hemObnKQhAWsHi2AjUvz2PkeyjeTcHXoHQ8CWPZ5UWMF2knstuQHsj6IY/N86PUJ7N1d
 q9EglFPwc7bMnCXAvZxfoJrGnzYQaKbPrWi682EeYAIM5hHxMOgpL+Qxjp/vfYFfhCFe
 9IhQTsJJuSsUFnvniNAUACPt1dph3y+/sbzFhKXnl4lqX1/0hhdYtW1nCbbarUEz0O+I
 illA==
X-Gm-Message-State: AOAM531InLwtAWgeaCYmXml5h8zxj1MBx1ADT3ajxoTRH1pHgTu9a1dF
 heZ5FmLEceIwhWb1E94QbtXoaRhQ0nRRzan+mNk7WdX4N3E11RrcyqoT1tQSplId4V++ZSFiE4s
 0gmcdIw9xwaJgcKY=
X-Received: by 2002:a5d:444a:: with SMTP id x10mr32425835wrr.360.1632201474987; 
 Mon, 20 Sep 2021 22:17:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyQDWd0916nAm4tTBQJK2m/R3BUudLaaeNRGzJijp/knO8xwcpZyKPAkqfS0EBipnc8jEa3w==
X-Received: by 2002:a5d:444a:: with SMTP id x10mr32425814wrr.360.1632201474783; 
 Mon, 20 Sep 2021 22:17:54 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k1sm18297338wrz.61.2021.09.20.22.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 22:17:54 -0700 (PDT)
Message-ID: <f5d29087-9952-6782-d19b-331d95bd0f11@redhat.com>
Date: Tue, 21 Sep 2021 07:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 23/23] test-clone-visitor: Correct an accidental rename
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210917143134.412106-1-armbru@redhat.com>
 <20210917143134.412106-24-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210917143134.412106-24-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 16:31, Markus Armbruster wrote:
> Commit b359f4b203 "tests: Rename UserDefNativeListUnion to
> UserDefListUnion" renamed test_clone_native_list() to
> test_clone_list_union().  The function has nothing to do with unions.
> Rename it to test_clone_list().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/unit/test-clone-visitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Maybe nitpicking, while this patch is related to the series,
although I understand you noticed the mistake while working
on this series, I'd move this cleanup as 1/23.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


