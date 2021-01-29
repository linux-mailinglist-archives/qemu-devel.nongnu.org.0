Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37272308D34
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:21:49 +0100 (CET)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ZL1-0004YD-QW
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5ZIU-000454-J7
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:19:10 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5ZIR-00036e-L3
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:19:10 -0500
Received: by mail-pj1-x1035.google.com with SMTP id a20so6304997pjs.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=apq752dCAmDuJqm+2ELUa3C6pd22b9zItAWbPaaff+o=;
 b=mlRPe0Nvo7jxLF1I5pINGhbyUrBmovVTDqob3GAI6ibydXofnkt297IbSalD+zaYS3
 uTC4+9owcWuL4NgtwkPRIvmhiLrijIvrcwY00a717bGKD+RtU47llML4Ehxwzf9g8jJA
 7/jwV3g3s/+8OuXmR5IsK9WJmjbViLvV9qTkVPFJrpgCk9tSSvm/GFD6X0sTFENk9eIF
 ijtITav6uvTLRfJXCxGFVlctojKcbPKgViRnMyR8bGgqh0efe3PvC/RXy+dHlrHW0MDt
 72jFDNisvcGrhDPehFciKrtGOZY0FgflEo4knVYTgcZbxWzVcibcWqXQOuk5EJCTvqco
 V32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=apq752dCAmDuJqm+2ELUa3C6pd22b9zItAWbPaaff+o=;
 b=LfUguoPk7dn2RVgLbjz7/9E9IOWNbV+cZUhU85tyOFoDNshY4/MzR+n3bV+/IiFKml
 p3SShwuZR0pFZh/+r5q79lgJvAlMfk4GMGaoURds6MI6uks91AFqtN+RPf5s2iQBzWzS
 v7ZTf7mZKaV63+6xiqanZueyal7FXJxpjKOJY+FDDeuXsXgRoVVE4z7wFH8EmOfO3V4K
 AIBSJMD9E3blbvmA8NCAmdSf45xl8eK33fSPcEoRY/Zra7EzzruO/sX/JXsVewzj+HiA
 r2llZ/bfGuh+ujwNsiF3rFWxth2cSQmdqqngpT8Sx7F5swok5CX3F5Po7UK9vboQdq6K
 2rgQ==
X-Gm-Message-State: AOAM531HbkFuXXOD5+q4RM2yoForDBpr5FSTJPZApe4OkAW2798zy/aU
 uAsPyuqGSpFGpktsF2XZKab8vH8+UUnHdR4G
X-Google-Smtp-Source: ABdhPJzJaoChRkVQ1An+M+9GWEEsYLv0KX8WmsiPRia00EE90MirHmcI7GQ8OC+lAH9nCz550LkGVw==
X-Received: by 2002:a17:90b:60c:: with SMTP id
 gb12mr5860498pjb.125.1611947945757; 
 Fri, 29 Jan 2021 11:19:05 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 16sm8358928pjc.28.2021.01.29.11.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 11:19:04 -0800 (PST)
Subject: Re: [PATCH v14 15/22] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
 pointer in CPUClass
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-16-cfontana@suse.de>
 <171c61e2-36f2-86cf-a5e0-15806cccfd0b@linaro.org>
 <c0b59810-98b1-5de2-3077-6521cc68f673@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33c1da5b-6f35-6540-becc-5d4e8a4703c8@linaro.org>
Date: Fri, 29 Jan 2021 09:19:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c0b59810-98b1-5de2-3077-6521cc68f673@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 11:00 PM, Claudio Fontana wrote:
> Do you think I should redo the series anyway? I would have started this way
> in the first place, but I tried not to redo Eduardo's work.
I think that would be a good idea, yes.


r~

