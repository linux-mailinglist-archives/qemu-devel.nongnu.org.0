Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA09612E42
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 01:31:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opIgn-0008Lo-KR; Sun, 30 Oct 2022 20:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opIgj-0008L0-Pz
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:30:01 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opIgh-0006rm-0D
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:30:00 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so4603453pjk.1
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 17:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HxWv9ZZIXKUWorZi7Efp4b7KhEKIOkoLTRzzvvdGd3c=;
 b=VTVJRMl8uFQQlhwyzQkGYjv/1ds5t1dEPkXCD8mwpoIQyGGaEennDx1XiQMFPHe9bi
 Zve6dh9xp89qK6dyOdtD4qkmUdyHmwp7/MpkcAxWZWGcPkLKXM5itgr1K8oeMV98vQzo
 qVnqFcKpsCLVR/Zw1zX4kA6ZhMQTAK6Tq9RaKsjJLPIGq36Dbi07NBos395bcZX/wphf
 Sj8nL22b5MCNshEgUo8/lSpaYWuIWPOt08xmK1P1PlG2HJeC9V13UTznBNn9qclNiIhQ
 MYHAzKWKwHpk8To4HFHcdRq2euvVg+rbYn3v+71OcqZ20FAHan0y0gHsXVEqKruhgnVh
 rfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HxWv9ZZIXKUWorZi7Efp4b7KhEKIOkoLTRzzvvdGd3c=;
 b=P/f/OD7t1czes+nFlAseoORqszWPW9OWvcPkjYRwIzVl5hEw3YOAyzpmQCY1Oi+jDA
 ukB8XxtdvYo9Ypefv9N+Nhvy60NMXUR1PARMUoQguhQOj5dKZ5kBbrm6KopCzIYgfPcY
 g1OEKlpz1EVcsYfa5Ll/K6eHnCEKJ61nHmp6QrPRMLsNteLVXnoSM5vmc+akHDf8l9Ob
 5FommHNVMJb874iUVMjGtU3ABJD/cMdmLC2wQWcKzVwJAFMVWvlou4j9Bj/7MBspZVX6
 ukV1jjN00+MWk4PUPtI084KAAh0Nqh6096PutHhbaYTgDR1ogSWPGuEYnGnstoNjPeuX
 df/w==
X-Gm-Message-State: ACrzQf25HbfNUHyYHpz6TTNf3rIIcxgA4TcPCt4EXIvBT75KTVel6CyI
 wL6NFbQTMkTfivAE4f6RzBbJqlRyeiW0nQ==
X-Google-Smtp-Source: AMsMyM6gS9Whf3znoUIRATu91cD2dC6ojyVx3go9TVw+u/htrbCfVHRz/a4FyZqC+ggjD9RA+1gSLw==
X-Received: by 2002:a17:90a:13c6:b0:213:b01d:b94a with SMTP id
 s6-20020a17090a13c600b00213b01db94amr9672451pjf.12.1667176197708; 
 Sun, 30 Oct 2022 17:29:57 -0700 (PDT)
Received: from [192.168.207.227] ([172.58.27.183])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a170902ca9200b00186e8526790sm3177521pld.127.2022.10.30.17.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 17:29:57 -0700 (PDT)
Message-ID: <7200a4cb-37c5-57e7-9475-6d35c284c332@linaro.org>
Date: Mon, 31 Oct 2022 10:27:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] tcg/tci: fix logic error when registering helpers via FFI
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>
Cc: qemu-devel@nongnu.org
References: <20221028072145.1593205-1-uwu@icenowy.me>
 <f28c1d8f-d30d-fc24-ce4e-88aba776abe2@linaro.org>
 <8e47bd2257004301fcd3ae17705e6b5351875f83.camel@icenowy.me>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8e47bd2257004301fcd3ae17705e6b5351875f83.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/29/22 11:44, Icenowy Zheng wrote:
> Ah I think this is a C99 feature. Is our C standard baseline high
> enough to use it?

Yes, we use C2011.  See the second line of meson.build:

         default_options: ... 'c_std=gnu11'


r~

