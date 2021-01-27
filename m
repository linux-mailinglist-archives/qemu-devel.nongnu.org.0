Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E03061CE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 18:21:07 +0100 (CET)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4oV8-00012N-Ck
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 12:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4oTp-0000C2-Dw
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:19:45 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4oTn-0006Wp-Mi
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:19:45 -0500
Received: by mail-pf1-x435.google.com with SMTP id t29so1599508pfg.11
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 09:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5R8EpyQnUef/6KdUDKcBBt/fhlh3g/QEgCu4PFj6nLo=;
 b=RUaPfIS8yiM3y1gqdqHaxCAmNdQSdg8158qWOOcCoXJDaZ0axCRTzajcRqEVy/s0Mh
 oLUdSruTKuAacH6V1qXcaKUk/DMt7t+zYeLVCAwfL32Oq3P7vbDd/Z/4jOwF/jMMOwNx
 je3JHzeR6SpNnwZrf9kHlPFREkV182QVtQTK8NnRm5yBf6PMlHemMjj2KrARoZmp09X6
 0sAIr7h+7IXjWnA1yAoC2H26Qq52pmvG9S3PIBO9y7MdiLGCC//fCy9oFjcL7qLWKy23
 uO74f6L6Yh16oTDkqq6nrfx0C/NB0s2CtTy9GWtP9/O6Q5Dxo7E4QPUpPljN3rxRR1PM
 7tiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5R8EpyQnUef/6KdUDKcBBt/fhlh3g/QEgCu4PFj6nLo=;
 b=ZT0kbbpqCxorpbMsf5B26vKSa9FQhjiXZHopgcIsrr2goHa2CDB+9LDgfqTT17e+gR
 1Qv/kndTN8UF11EawoRp1QJ6NqLUVgfGWSsPdRbekfQ/oL8ZvTlRde7hgXNDmN2Ljp67
 PyQTbfGjMeHrkBh/Zg5sgs/lM7P1vanHSF4aFvBDEbT3dM8k8TvPt7WwMhR0tP4B24SK
 Kx1oox33ye5tp6a1nNPvMDVRNIu61fkSqzf2qx+sNdY7aGipzy+RB8UvkLurI+dJjuZo
 LFVVhkxvbfQy3D9Rku6qrZMqGuSc+D8HBsfjKbxCYfXavz7iIWgee2heVldvFM7I2VaF
 dz9Q==
X-Gm-Message-State: AOAM532nr3IiRZfy+LWAL97Qr9A5C3hi/sZP6EWg2qEF+qUs/HJTmeKC
 snkN1vSy07WjGCsqt+g7SJ44iw==
X-Google-Smtp-Source: ABdhPJyocjjBWX197aeSJYtRuI2v0uOfZ0EftyNHncmClNH1katJ3ezGK8TV+Ru0GWQdsUVykdhGoA==
X-Received: by 2002:a05:6a00:88b:b029:19c:780e:1cd with SMTP id
 q11-20020a056a00088bb029019c780e01cdmr11534614pfj.64.1611767982078; 
 Wed, 27 Jan 2021 09:19:42 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id k4sm3001613pfk.44.2021.01.27.09.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 09:19:41 -0800 (PST)
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org>
 <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
 <bbe4adfe-5bed-c37f-78c6-b120cb192aae@linaro.org>
 <a8aaa601-dcb4-ed87-d7ba-f6362942b596@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af9fe8d9-50fa-c065-7afb-12a9d237df21@linaro.org>
Date: Wed, 27 Jan 2021 07:19:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a8aaa601-dcb4-ed87-d7ba-f6362942b596@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 8:53 PM, Stefan Weil wrote:
> And the remaining TODO assertions are a good indicator that the current tests
> are incomplete for native TCG because they obviously don't cover all TCG opcodes.

If the symbol appears in target/, then the opcode can be produced.  I've just
shown you how for 2 of them, via 2 different target architectures.


r~

