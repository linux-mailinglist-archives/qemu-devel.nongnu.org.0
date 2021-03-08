Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4785F3313AD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:46:26 +0100 (CET)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJ1V-0003fa-4x
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lJIwi-0000KS-N2
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:41:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lJIwe-0002HA-O9
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615221682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2vRzRcBXhNnVNZW/UmGLXiSd/3Eff5uzpeFbObVSkU=;
 b=a7UKggkTllZo/KY1D4/etdR7CvvjmOl0bog+cuMe5tYsdZ7CTbCyQL0hOpkwoD4e8bWNUM
 BGoT0QaUOzeFif/OJ+6UWwfXASxEM0ucaUhII6G0PHIbLIY746gur1zdul81fkTjsu+Vqd
 8+qCrr3j2BDlwNE9jsW3uTlPk7nrqTs=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-OjRrlOSGP2yzZSLYEWHcEw-1; Mon, 08 Mar 2021 11:41:06 -0500
X-MC-Unique: OjRrlOSGP2yzZSLYEWHcEw-1
Received: by mail-oi1-f198.google.com with SMTP id s206so5079955oif.22
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 08:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D2vRzRcBXhNnVNZW/UmGLXiSd/3Eff5uzpeFbObVSkU=;
 b=PuIVzR+IBwjx9oycRHlzxoFN9xw4vO9swRs3wKkGn+MZQLXlIwIzocWE4sktAGiakY
 sl7a7E5azbT8QfxoPVmsxleda/jB71fyBuTlAsQI+sO/id3hgeRRmctG7HsGeisMAVsz
 DFawjCMceXwvt5ayHCBLj8J8+iHNlhBLW8JntoYFET9Sac8JwFRJ2a3rtqF8xSgBHz1y
 YeOmBPGIvWWV0C7jPaFAJ2MT2dT8NNNm5oXkQJKAx56IJyeGgiLgR5hv0PZLFYHg5y15
 ROtFnFJIkc6DYbdSgajs9fMwlluHmun8CXYVwyV3jnpei2qeMmtGui3gYptXcO/W3+0G
 jQZw==
X-Gm-Message-State: AOAM532++wtbU1UQmdjHxH3ob+BuCxrRCX6+qGKrvHi192880Uqt93Fo
 7RwreerKQi2v5IFHeVWjposxOQ+J4zZsG9R9oiI3kTvb/QSwLzKtA/lN025SLVnsQcBzpQx6FwJ
 vaNQ47SEemCuKkck=
X-Received: by 2002:a9d:881:: with SMTP id 1mr17847891otf.329.1615221665913;
 Mon, 08 Mar 2021 08:41:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj+VbES0/odIB4wY2yDp8wzxkjspNnr1oWart5e3AgoA78blidY0xfvV5vTCqemyfrtKfGAg==
X-Received: by 2002:a9d:881:: with SMTP id 1mr17847881otf.329.1615221665734;
 Mon, 08 Mar 2021 08:41:05 -0800 (PST)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 24sm619176oiq.11.2021.03.08.08.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 08:41:05 -0800 (PST)
Subject: Re: [PATCH 0/2] SEV firmware error list touchups
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
References: <20210218151633.215374-1-ckuehl@redhat.com>
Message-ID: <80d8d20c-d306-b2e2-b542-7104037ead08@redhat.com>
Date: Mon, 8 Mar 2021 10:41:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210218151633.215374-1-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 9:16 AM, Connor Kuehl wrote:
> Connor Kuehl (2):
>    sev: use explicit indices for mapping firmware error codes to strings
>    sev: add missing firmware error conditions
> 
>   target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
>   1 file changed, 25 insertions(+), 23 deletions(-)
> 

Ping. Also, I am not sure whose tree these are best suited for.

Connor


