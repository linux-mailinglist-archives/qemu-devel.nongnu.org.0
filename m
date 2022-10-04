Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDB75F46E5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:45:38 +0200 (CEST)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofk6z-0007eX-24
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofjOI-0002oZ-Eq
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:59:26 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofjOG-0006qh-H3
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:59:26 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so2101765pjs.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=PdgwjQnlGzoDtYo8oSbTotMhvFeXuOY5x0cLYHLdj2M=;
 b=uUjC2HT6RlQbYOAUAASRht9X28+hO/DSpxjakpAkUbhqACzTa07Nhfc5aQsBQq9FOE
 jrjlzB3Q2hiI/AUxWi2DWnr9P6MZC8Fl68+VIYc3xgASqcNtV0I6MpaR7lBe2sE+q9Ye
 n09VtaSOa1cw7lNvE7Ieg2ntegfhcMXDF+i1BMqS5y/ZgXZcdLUnZTfzf5Kacygcr2Et
 9Q5Zv7MzBhlOf8cuuLtpAVXob3onJBpRW5RNHH4Fct7Tt49DdymPGOKncgqQlScCOl+t
 AskTcgtgG5rd8F0le8rNjTm8AnUKSzHDBcvsE8qeCSYaKgXDtKfHifx2s1MNj5lDa/Nk
 LBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PdgwjQnlGzoDtYo8oSbTotMhvFeXuOY5x0cLYHLdj2M=;
 b=Qe1kqIbtO09c5o4hyPrRHG9q358JFjM8eSnhDhnFbGwh1OMbHq/XkpyXAfTvqbJ8xV
 qz5HgdldVlK8Q7J/k32srm48TJsT0Bp3qmF/Zlhlm85tkGtZ3UWjFeIqVItDZNc6HarS
 av5h8rBtMfAiQCdUQVlPgypVGaGZesgkPQtpkZgLPLPZBPahZvGy/04avw0c5Di40+du
 dFwU+RIK7pI9pnDowXAAYIU5Ls7XNjmD9fxqeHaW/3G8yvpvHFO3kcZq+0RLMRNwOiiu
 B4+MRMWEeiXuwpeVlSSer6tzCPRdArEd7FzvB1x2ruvFGk9AiKhy6ahBMQ8hrjjqhYn1
 FPQA==
X-Gm-Message-State: ACrzQf0A88+vq0g0D2AUlWTdQEweo1oBIeRiv4qsGj2eVsdKXVbqf7cs
 oPvh9fVuwCQdDTmfiy+4m/5muA==
X-Google-Smtp-Source: AMsMyM6U9Cbu/jbR0/2kCbbmaw0wxEBWh2wsD81qq2VtR3vfifNun2Gmxfar+XxlqzyKFDYM3vsclQ==
X-Received: by 2002:a17:902:e884:b0:178:2065:5c29 with SMTP id
 w4-20020a170902e88400b0017820655c29mr27981282plg.114.1664895563075; 
 Tue, 04 Oct 2022 07:59:23 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8015:12b0:403e:a15b:ff5e:d439?
 ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 z125-20020a623383000000b0053e38ac0ff4sm9347821pfz.115.2022.10.04.07.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 07:59:22 -0700 (PDT)
Message-ID: <5c5849a3-6830-8577-c427-02cb3244ba8c@linaro.org>
Date: Tue, 4 Oct 2022 07:59:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user,bsd-user: re-exec with G_SLICE=always-malloc
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, ncopa@alpinelinux.org,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221004120047.857591-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221004120047.857591-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/22 05:00, Daniel P. Berrangé wrote:
> g_slice uses a one-time initializer to check the G_SLICE env variable
> making it hard for QEMU to set the env before any GLib API call has
> triggered the initializer. Even attribute((constructor)) is not
> sufficient as QEMU has many constructors and there is no ordering
> guarantee between them.

There are orderings for constructors, see __attribute__((constructor(priority))).


r~

