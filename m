Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A28698CA6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:10:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXT0-0006bX-PD; Thu, 16 Feb 2023 01:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSXSr-0006QW-LM
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:09:54 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSXSq-0005Ox-0L
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:09:53 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 z14-20020a17090abd8e00b00233bb9d6bdcso1126123pjr.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 22:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L8iCqxUEWyUXSPuuYAc2So/k2uE1D2qw/Kx3LqgW/eA=;
 b=qbDUWMIRQtLdKCUueMXx3opoBAWqu4PGyQ4Bz31w26BhRl5EeOSt4AFobbZkw5VjyR
 NnVfKOOUOO6LNNFyKhFiikYaxY7aj2V6ZqwqHn0frVZQFMkqqHNfzS1e7jORX7pfYb5k
 OLCUc+DxCvRkdYQfyLjvsomdrzpPK71dqpqFfB9XBd2PlhbVBSV+kVfQvE94AX/cruFW
 g1YM70lgfj7tq4SzA3E1CvrZzF1nJMdRtEgbLgLNgTo6N8WFlXGigw7vBMJXmQfZRbuk
 eQ7NXX2F+UhpQhOS/7bnO02HaUnXZax7SYOhRdjJUF1PyVAHRKee+UA5NVwjbhyO4d4X
 DHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L8iCqxUEWyUXSPuuYAc2So/k2uE1D2qw/Kx3LqgW/eA=;
 b=M97M7kvoi2X9qzFMQ14/iiQ6NXUTa/eKW30jQZSYPZP4/DiUMJiEN5Ogvam1GjY6QE
 qJqUNFP09gsUXkNmW+VwSDVO6JamyDOy727eqezhIza9tJMx39A1HM0IGdq1bYz60F7I
 aS0TbY+0ga9OpK9bM9b0pELeIEdjrl0hynSLWjy9hjLkKNlk+4Xn60w2ubzidAw0DKN9
 CRVmWzF69/ke+iTOfOw6alU4kzr0cWp+Kllr+rDK+9x7QYVMjehECXUqFjOwGmg5uB99
 XCdHaCmkxF729ns+1r6zy5EWqgISGq5cOotdOw6c4qqWbCf723/wYzEueRdXQdyIytUX
 xFIA==
X-Gm-Message-State: AO0yUKV28NgqJxy7Z0zjrurNdqSgXxwI7vIePGuFsY1L8TlBKwYIwPto
 It2K/GbVFgqz2UxG08oBWCS8cQ==
X-Google-Smtp-Source: AK7set/PJigzlsXeXQn9Fg/uk1omPEP9P4dewcP+2Ktky3J7s4tuD3KVXvartWz9fPJjE/6bJvS3EQ==
X-Received: by 2002:a17:903:32cb:b0:19a:b302:5176 with SMTP id
 i11-20020a17090332cb00b0019ab3025176mr5722956plr.46.1676527790583; 
 Wed, 15 Feb 2023 22:09:50 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 u4-20020a170902b28400b00199481ac72fsm358140plr.225.2023.02.15.22.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 22:09:50 -0800 (PST)
Message-ID: <4d2046c4-85c8-a73a-017b-3c3829221573@linaro.org>
Date: Wed, 15 Feb 2023 20:09:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 0/4] Fix deadlock when dying because of a signal
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20230214140829.45392-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230214140829.45392-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/14/23 04:08, Ilya Leoshkevich wrote:
> Based-on:<20230202005204.2055899-1-richard.henderson@linaro.org>
> ("[PATCH 00/14] linux-user/sparc: Handle missing traps")
> 
> v3:https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03534.html
> v3 -> v4: Add printfs to the test in order to make the uncaught signals
>            less scary:
> 
>            $ build/x86_64-linux-user/qemu-x86_64 build/tests/tcg/x86_64-linux-user/linux-fork-trap
>            about to trigger fault...
>            qemu: uncaught target signal 4 (Illegal instruction) - core dumped
>            faulting thread exited cleanly

Queued to tcg-next, thanks.


r~

