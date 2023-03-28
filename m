Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5035D6CC37A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 16:54:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phAgK-0002S6-TN; Tue, 28 Mar 2023 10:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phAgH-0002Rw-O7
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:52:13 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phAgG-0003yC-7L
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:52:13 -0400
Received: by mail-pl1-x630.google.com with SMTP id c18so11884376ple.11
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680015130;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A5GbArqfLagAciyB8bgIbn+dtKvHGwM0ZsfpiCpnqlQ=;
 b=XNUrsKfufPFAuzChvS3BvLtSKA4Ub2X1V67UkiCi/V9Ey6nwpbVLX2rFsnIA00cEl3
 4ulfTr+ZCHQp84p3SofzIbgSfh2jeilrNgv4IAD4YKxdvIbqMiF+vMnp6REPGSxzbYpu
 a5CRu2fGpwuGa3xRgCLZyT1xhmGEW4cIpahXxT7bggSYYTWdMQqgvyYHfFTkUTuKJ+OG
 bA7HuBrF+Saz+1V5WYKPo/B6kgTX/fHHqOIyxssTc6d66MaPNO4CnfE8sXlj/Hb1NEpL
 K056QOur0EpzK06PaXNvhZSNyNXF0zwWfY78fWhvFLW6LKB22+l/3mo18tDWaKj2VSpj
 k3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680015130;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A5GbArqfLagAciyB8bgIbn+dtKvHGwM0ZsfpiCpnqlQ=;
 b=gnZdlsT8CQCXqWnfkz3V1L511yO9mzT9ZZvMHFd4SdJVyfEmF65801n2/wneYYr2Nu
 33ufn7AntS9fk8MY23gOEfoBR0MD7k6w/7YSuT+oun63ml8u1KLZAgEdVxICVJjuF39d
 4hb+uTbefMlQr065vEm3Jmc8Aj7GCB4hQnMkP4arrIe0LFoatnjFi6jvzKqL1Q5pH+NZ
 uQ2Tyv1FSECwXKLtEykzVbyII/v20Qnj8aZ28hOEiTj17LCDAeJAJv+teN7th1PhODsN
 uDw7M+DwpNvSgQSSz3csNGRsOjr/pHJnbip979M0FWU3PM8T7o+L7D/MYhKrjJPkeMPo
 gEVQ==
X-Gm-Message-State: AAQBX9f3wjuMhT7yiFD/mgbwxvWeV4Ngt61WghAVxmDROU80tsNo9Vbq
 nv75+bjO0RJc7JEvtvgXXHeGIw==
X-Google-Smtp-Source: AKy350Zt9k0jZ6nxBA8L86PaO3/1+yBvxLfL9ZQ4kf//HnQqsDUnUt9nMCeV29k5+TmoQKT5MgiHQA==
X-Received: by 2002:a17:90b:1bcc:b0:23b:bd09:7f0b with SMTP id
 oa12-20020a17090b1bcc00b0023bbd097f0bmr17757263pjb.30.1680015130374; 
 Tue, 28 Mar 2023 07:52:10 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a17090a398400b002405d3bbe42sm6144757pjb.0.2023.03.28.07.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 07:52:09 -0700 (PDT)
Message-ID: <db7c2a6b-3457-b889-1476-486fb456613d@linaro.org>
Date: Tue, 28 Mar 2023 07:52:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: stat64 wrong on sparc64 user
Content-Language: en-US
To: Luca Bonissi <qemu@bonslack.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <db07e036-cc5f-c9ad-b63c-10fdd5404830@bonslack.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <db07e036-cc5f-c9ad-b63c-10fdd5404830@bonslack.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/28/23 04:48, Luca Bonissi wrote:
> On qemu-sparc64 (userspace) the struct "target_stat64" is not correctly padded, so the 
> field st_rdev is not correctly aligned and will report wrong major/minor (e.g. for 
> /dev/zero it reports 0,0x10500000 instead of 1,5).
> 
> Here patch to solve the issue (it also fixes incorrect size on some fields):
> 
> --- qemu-20230327/linux-user/syscall_defs.h    2023-03-27 15:41:42.000000000 +0200
> +++ qemu-20230327/linux-user/syscall_defs.h.new    2023-03-27 21:43:25.615115126 +0200
> @@ -1450,7 +1450,7 @@ struct target_stat {
>       unsigned int    st_dev;
>       abi_ulong    st_ino;
>       unsigned int    st_mode;
> -    unsigned int    st_nlink;
> +    short int    st_nlink;
>       unsigned int    st_uid;
>       unsigned int    st_gid;
>       unsigned int    st_rdev;
> @@ -1465,8 +1465,7 @@ struct target_stat {
> 
>   #define TARGET_HAS_STRUCT_STAT64
>   struct target_stat64 {
> -    unsigned char    __pad0[6];
> -    unsigned short    st_dev;
> +    uint64_t    st_dev;

All use of the normal C types is wrong for target structs.
You must use abi_{short,int,long} etc.

Otherwise, you may not get the alignment you're expecting.


r~

