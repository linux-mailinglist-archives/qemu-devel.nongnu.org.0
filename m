Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910E951F975
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:12:19 +0200 (CEST)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0NG-0006hu-CU
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1no0Ik-0004I6-2f
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:07:39 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1no0Ii-0007KU-DZ
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:07:37 -0400
Received: by mail-ej1-x629.google.com with SMTP id dk23so25792794ejb.8
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fBfPzF3dlYGa7dPkx9pYY4ihzcKEEVXbqQAGEF7AWLI=;
 b=LYgseHTiLW9YY3F8xDrpov4eR9hQR4C0B2ZBrQIroaUQuXHJ8HVsa2waw2X54uI55G
 q/AWGi99shouqUFXP7bzjBXzuUVhn/enLV7hlzbKpJg+p6N5pviOWDMzDU9E0J3kAdFh
 cNxQUNaHfT0urvEZvIgYk6T+FTcm0OMfHDoN0vHDP2prylCIL0ndCriXXna3W1Mja38q
 XQj+oZDf/ZLkF+H9uL3UO1geYo0x/4vrcOrxAmWloplwXrxUhgN2ig3dKhOyChYWBcC8
 P5pnamE/XDhIXSjlZtcuYfi5oMISCBV+zW1YwoADEo4tUXyfoyTgepQH2auqlL6Mq6Jr
 0FfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fBfPzF3dlYGa7dPkx9pYY4ihzcKEEVXbqQAGEF7AWLI=;
 b=Nx6A31btfmfC90ibFnxBn3x+RQeb5Foj04vISW/cs+zYrSgYrBI8yotqWHsy9s/aGO
 /2yLvD/Pqg5mbsMywuM14Lu6R8XEr3LGlI5PTT6NAORBUghx74bH+iSkRTPJkNFcIt2D
 /biAJiQLezfrw9Plyd8YaJwfNfpHq7QicS0GX4MC+ek4oEN3Mq8ahzvV92zy7bcoOeDp
 0Gq1b6i9yK9V/SqsypFRkVKXi2xx2lCB0X0ecun2VVYf3FsTP1OAJeTAkLHHMx3HVvSw
 MCn+s4Ziz4EuMYLsiwXZddRz663xwZyps7GFC4jJxoIJyFAjil4l4+ZEaWjHqUqa4kQQ
 1Yvg==
X-Gm-Message-State: AOAM531RBxJWnu4/oijmblV/eii6YII0eAG6bKjAVO+EuSdCtqb2M4c4
 Wa1omqNfwal1mA0lgf4eZ0c=
X-Google-Smtp-Source: ABdhPJwG27oKwr9jK7Az3NsKdaFB7uRWYKvM/5s7l90qIUhdX4eEloPjTE4bdKZUABE+suM2A3OH4A==
X-Received: by 2002:a17:907:8a0e:b0:6f5:a48:e04e with SMTP id
 sc14-20020a1709078a0e00b006f50a48e04emr13664772ejc.228.1652090854165; 
 Mon, 09 May 2022 03:07:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928?
 ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.googlemail.com with ESMTPSA id
 eb7-20020a170907280700b006f3ef214e4esm4886276ejc.180.2022.05.09.03.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 03:07:33 -0700 (PDT)
Message-ID: <f2698921-d40d-c3a3-b62e-622c0b45bde9@redhat.com>
Date: Mon, 9 May 2022 12:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/2] thread-pool: fix performance regression
Content-Language: en-US
To: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>,
 qemu-devel@nongnu.org
Cc: stefanha@redhat.com
References: <20220506114711.1398662-1-pbonzini@redhat.com>
 <452936f5-3bfb-9cf9-d0cf-cb8eb3dc8ddc@redhat.com>
 <e4b7ed3b-4ac5-6b16-525f-4033199f471c@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <e4b7ed3b-4ac5-6b16-525f-4033199f471c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/22 08:42, Lukáš Doktor wrote:
> Dne 06. 05. 22 v 20:55 Lukáš Doktor napsal(a):
>> Hello Paolo, folks, I gave it a try (on top of the f9fc8932) and
>> it's better than the f9fc8932, better than the previous patch by
>> Stefan, but still I'm not reaching the performance of d7482ffe97
>> (before the f9fc8932 commit):
>> 
>> f9f    |  0.0 | -2.8 |  0.6 stefan | -3.1 | -1.2 | -2.2 paolo  |
>> 5.3 |  5.4 |  7.1 d74    |  7.2 |  9.1 |  8.2
>> 
>> Anyway it's definitely closer to the previous baseline (~-2%). Note
>> I have not tried other scenarios, just the 4K nbd writes on
>> rotational disk. I'll try running more throughout the night.
>> 
> 
> I tried a couple of iterations of fio-nbd 4/64/256KB read/writes on a
> rotational disk and overall the latest fix results in a steady 2.5%
> throughput regression for the 4KiB writes. The remaining tested
> variants performed similarly. Please let me know if you want me to
> test the fio execution inside the guest as well or some other
> variants.

Considering we have conflicting results (I get a 2-3% improvement over 
6.2), and that in general aio=native/aio=io_uring is preferred, I think 
we can proceed with these patches at least for now.

Paolo

