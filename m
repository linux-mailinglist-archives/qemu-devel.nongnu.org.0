Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C3D6F713D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:40:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucor-0007ok-UG; Thu, 04 May 2023 13:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1puadd-0007we-GP
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:12:57 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1puada-00009I-7b
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:12:57 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1aaf91ae451so5245855ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 08:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683213172; x=1685805172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8+W9dglJi0LCNk5Os9N7KYrKJd+qz0snwzWXG8Kq7BE=;
 b=c30KeaTh9gi8muUGg1/6/G8xvsqpX6kPM43wCJ3g4DrzlqYV/1CIAcKGhXyg6VdsTc
 K1vsLDlstpVD6uGlYmeoVwW1BFt5rUzueTcJr0iTWkSUgjZmWCfh/GJ9KNkA7+H7yACL
 weeTem8ZtQg8HDE+XGcNt0CJgQM23WxJOL3pKDGClFdRo4ld240nKI1Pm8PukQWAFgd5
 NYl5RanD9Tf6p+SS/dVceauOtUfjm2FbW/FUPjZN+5KFTxuciiQLB1QMEX5fjf58QkiP
 sT3u2xP8UU0LPJNJlDs3v73G5A6selBC/DVx27156O6iMSOyyLEV7fzKxdluCvNHxjFG
 Tq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683213172; x=1685805172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8+W9dglJi0LCNk5Os9N7KYrKJd+qz0snwzWXG8Kq7BE=;
 b=Ftoo6PsJYnGRRuah1a308s10yX8IyHd6j1G9qaADxv+YcOGFkcWESSRXJcrFGvSixj
 hk4uY4KSE26RRG/wueBnqAiehoq71kz9h1w1C0BNogYPFfKGSfCCmwasufpwW4hR+tOd
 6/YhXc2xMDChW5w2qFlFj1D2p/SsR6kWOjKEaxsmqVyAV6NJC7wI17VZnI/krEm+m8Rz
 Pyi1d1ZLSnCDOxLdU6eWIzWggDiLuQ/+qMbIKePThDVd24ZDS3Xv5vwLUqKCK40A1dZ0
 +bxHE8m+jsiwegmpl8ei7SMByriE2yobSg1iblTQhNYYdgjpqWYPYMW6nT4xeTzPKzar
 HIrg==
X-Gm-Message-State: AC+VfDwoTcTZ08CDg7HDtN9oiHwCTZf57ULxuYKFg5t65V87jcQLSLQv
 R7r9WDFCw9XsTUEKxtT8Ahqjxw==
X-Google-Smtp-Source: ACHHUZ48mEA4pEyc0GCc41VocGd/lunxZv7V7kx6IdH4MgyYBQFNt2XnADG/qsCUedq0l4F06a8ODg==
X-Received: by 2002:a17:903:11cc:b0:1aa:f616:f5a5 with SMTP id
 q12-20020a17090311cc00b001aaf616f5a5mr4889955plh.29.1683213172708; 
 Thu, 04 May 2023 08:12:52 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a1709027d8700b001a653a32173sm23505334plm.29.2023.05.04.08.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 08:12:52 -0700 (PDT)
Message-ID: <7a39e1fd-2fd1-2a83-bd63-46aa5ae48880@daynix.com>
Date: Fri, 5 May 2023 00:12:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 3/5] igb: RX descriptors handling cleanup
Content-Language: en-US
To: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>, qemu-devel@nongnu.org
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
References: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
 <CGME20230504131106eucas1p13530e4d1f10ca1086b39b37feddc3e28@eucas1p1.samsung.com>
 <20230504131055.11767-4-t.dzieciol@partner.samsung.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230504131055.11767-4-t.dzieciol@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/05/04 22:10, Tomasz Dzieciol wrote:
> Refactoring is done in preparation for support of multiple advanced
> descriptors RX modes, especially packet-split modes. >
> Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>

I guess the refactoring of igb_write_rx_descr() and 
igb_write_packet_to_guest() can be split. Please do so in that casea

