Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4166AF03
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 02:54:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGsCh-00048J-Mm; Sat, 14 Jan 2023 20:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGsCf-00047W-3t
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 20:52:57 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGsCd-0006RJ-Aq
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 20:52:56 -0500
Received: by mail-pl1-x62d.google.com with SMTP id g23so11460584plq.12
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 17:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zvCUf41BgWFSGqgERJze2tha/aSKASaaDxbzT5xzSCA=;
 b=HuiXA6M29a+ZvHSBL8eeGAUzWx0bHga7nHzfI2BOK+LUp4HKRoSJZ6G7HGR/zqN3uh
 q3a7Nmu52++obIpF54B9FSSJRDQNcMA9ODPsBOAwpP05ll5qMFffmUF3894sW9Wa6Wl1
 2bHItrrMwA9DpH7dMg5l0Y6SuByKZrSUG3o1RdXNOLgqZUo6Ud93Isu7TY4TOmYLj3AS
 bcxvLPKzSEYuAUzm9wpt9qkuJ2jD/UaSuffl6J9m1c0Uk8FV0HoeCq+IjE4H09wzxuXj
 7OdVli1l0hy+QF872Z7N4SgWyhhFgXDdRWS/be9yobIGZYJB2xwmEV8Cu9YJoX4lOjn4
 u2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zvCUf41BgWFSGqgERJze2tha/aSKASaaDxbzT5xzSCA=;
 b=LP03bjvUtZboYi3mkO7aNjQiiquZRWGdZ05E4MN1qKv/9cbrzgK7M9qu2ks9PLZrzj
 0eM9PK5RHG+A8kvFl/xtN9l7wkX5ZyMh5590nJKNY8OjjCLFbUZVj/IgG3yAqeuWrOMg
 L2FiO05vj2ehsIOSQIiLyupeYAz4vk47cduqOwaizxKuWwxCW90JDoDyqIeE/iE56Tvi
 hX+tKJkerN1cGGypaBL784vaeEgQIwOUcqsa0dIBHoiTf0lCojFyMbuPq/nMaQb7QFMg
 jZq8ifS8lKLL+vAiBQc8HBhTejHwb7Gk4rwd0parpqd1dsmBsqUsPa1DTM/Rev0nhrY7
 YjkA==
X-Gm-Message-State: AFqh2kqovEB4Bw22xItWlKcguo2gGBH9I6na8JmuGeT8s3IaLdOISCTP
 /fmCQLdRBBrQaly43+mPJxyWUA==
X-Google-Smtp-Source: AMrXdXs0V+stc6lwgLZS2gBKPumBCZCWDYvgeEwxxDgmlcuYhWOHJPrdKSZ7yxt83GRvS1yA7JE0pQ==
X-Received: by 2002:a17:903:4d1:b0:194:67e1:c85a with SMTP id
 jm17-20020a17090304d100b0019467e1c85amr8049346plb.16.1673747572088; 
 Sat, 14 Jan 2023 17:52:52 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ix15-20020a170902f80f00b00192b23b8451sm16631899plb.108.2023.01.14.17.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jan 2023 17:52:51 -0800 (PST)
Message-ID: <e25db9ec-edb2-4dc1-6b7e-3969449f8a8c@linaro.org>
Date: Sat, 14 Jan 2023 15:52:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] Reducing NEED_CPU_H usage
To: Alessandro Di Federico <ale@rev.ng>
Cc: qemu-devel@nongnu.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221228171617.059750c3@orange>
 <ad150bbe-6a59-7b46-2e7b-bbc8441e118a@linaro.org>
 <20230112162821.21ae8d7a@orange>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230112162821.21ae8d7a@orange>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 1/12/23 05:28, Alessandro Di Federico wrote:
>      fpu/softfloat.c

Something I happened to notice while doing other triage:

     https://gitlab.com/qemu-project/qemu/-/issues/1375

This is an x86 problem that currently has no solution, but ought to be trivial with the 
changes to softfloat required for this project.


r~

