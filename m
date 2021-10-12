Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EF42A429
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:16:01 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGhM-0000k8-3p
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maGcK-00040F-Jn
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:10:48 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maGcI-0001Ai-T0
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 08:10:48 -0400
Received: by mail-pj1-x1032.google.com with SMTP id oa4so14813171pjb.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 05:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/DsWeZ/jIBxicttPMkFFFHave+l9qBYCmO2oSpj0tFM=;
 b=UEqxHNMdojYklEbO8h+U4hHJV6TpQoGDhxLrYH1YFlODuY3jdpmZD8Nr8gmE2pDZhg
 DjHfor8+/ctO1wKLKnnfs2UJWrLh1TGo5Pv10UHd5AH5ZiAcZ1soXskHdRs8JiGy2o3S
 RHiaYocmf0+ni/LCF1vWR3DWrlk37Pst0rlQZFoYYXP2JH6R/BeOZgU3JrOmLdiJdB/l
 TpnHz7c5Z3I5enY5QwM6Mm6alLXeBKhENn77hOaLPqPgUWzz2nU5ElgxSkR/n0GcWZ0N
 hApIuS3AV62i3+D2I4X7fa8B9zp44s4OhGYq409LfKYNVWdyYbXYVbNV40jR85Ybq8ED
 cTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/DsWeZ/jIBxicttPMkFFFHave+l9qBYCmO2oSpj0tFM=;
 b=lGRa2KicDKfhl0OGH+vZIhj5GIiIp8Am0tnJZHlSC8rXxZgb5MoBkFYe3IeWE9r9Bv
 AWaUFRksnUUtypjXK8bWVB4gv9iMlK3vGnhyEii89pFWVjpBKJk7nlUO59kqsdxKOcB5
 QbxDVjHxvr19/byXrfHJ3ijCNSxCnndHMlcjVWNlkoGs4qULawWUcQsmYjffXAcGTZtF
 7xzOGdhpGW1V6Oo9fngaJUxxGergTh5675k7hHvGdjhwEFkGumyTjPeXo1kuPlMpTfNl
 aQKafYqtBXYF9XkcgG+WQTp36a+tKXIUmIVZoxYDTGNwbkrPEl6+9IWb4Z66TMDiOdzl
 THyg==
X-Gm-Message-State: AOAM530iZhqucLda2u2rucWDdgGFFyI/A0H79oBXV+r+jeOuhZjn5lMv
 fiNZ0SjQmsa78NumrYTs8wJ+xw==
X-Google-Smtp-Source: ABdhPJxF9QOG+daUOd8xg5hWQb+ULRRGPig2DMGtGe4ON/6lKnP6awUymZA75Wj5rP6gcPWDDPbxnA==
X-Received: by 2002:a17:90b:1102:: with SMTP id
 gi2mr5532695pjb.43.1634040643958; 
 Tue, 12 Oct 2021 05:10:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o26sm6843185pfp.177.2021.10.12.05.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 05:10:43 -0700 (PDT)
Subject: Re: [RFC PATCH] target/s390x: don't double ld_code() when reading
 instructions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211012093128.3909859-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b512ff29-4db2-5574-7e2b-b806db624d0e@linaro.org>
Date: Tue, 12 Oct 2021 05:10:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012093128.3909859-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 2:31 AM, Alex Bennée wrote:
> For the 4 byte instruction case we started doing an ld_code2 and then
> reloaded the data with ld_code4 once it was identified as a 4 byte op.
> This is confusing for the plugin hooks which are expecting to see
> simple sequential loading so end up reporting a malformed 6 byte
> instruction buffer.

I think the plugin stuff could be more clever, knowing where the read occurs within the 
sequence.  Otherwise, we should simplify the interface so that it is not possible to make 
this mistake.


r~

