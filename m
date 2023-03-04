Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167236AABEB
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:42:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWoV-00037y-0p; Sat, 04 Mar 2023 13:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWoT-00037b-1c
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:40:57 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWoQ-00077w-Tq
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:40:56 -0500
Received: by mail-pl1-x643.google.com with SMTP id h8so6081150plf.10
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677955253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gFpphVQj191BIcIW+ChVcVHcsvXXMgVi7PE5LfNB/Oc=;
 b=BFtKbb3O255/biEMgY/SrggichBbqf6xHr3vYJ00WgNsMaYyXydVY+96oJRwjQ+Trk
 yQ47nIV5bImGqoOkQrOLy5KifAS8TrzZl5U+rRJNEU/eCJRMtuhnIagqla0KIZZ5DZRN
 webNZNxAtygZ8lxsfp7WLM4C83JBWH8+4j4BbxizQjEgTUj/Y8QCNT2nDOUIprAPopff
 kvnQCYEeaAc3dX/p/HE/2tX67XBAGeVoP0qeOuqgdgDbuYAMDtqZwC7iHsrZ6HMc2zPz
 Ksr8jRIELa2rNPjYL4WD+bxfx96MLTSRAtrYNiymlJyf5UzCkGzpP1zlg87Ep6IlgHET
 91BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677955253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFpphVQj191BIcIW+ChVcVHcsvXXMgVi7PE5LfNB/Oc=;
 b=USJXgXAGcMS5T9ToeYbkAtp8sXAReYS8aNw63OeSK8ALAwYXjLM2VSH6mrywuXBUez
 CZ70I6lx/uu60dgGp+2j/AiQD0hx+CQOkUASc0T3mCCBKKgjoFPlMiOSw//hP1gvBtBi
 4MU4OayONwl4p5aF4J7GGbcDSV3EtogpCG0hIMjiAjJqOEFqEcJvJWJgABc7d2d4Scku
 f9D5y+Aq1YRCCkgEWuWpMDg9Uz1i8VOMf7e3qdVN51f6zdSqCbqqGwVURuVUuDl+72k6
 esLVBtC+fjWvDT3yPJyBKvOFcgu7xaS3qe/7vJbs9wrlN2Kf/JffZGrDAGiocN8y5+82
 iP/w==
X-Gm-Message-State: AO0yUKUBayeZasUOvhpU7krn4fIQZVS+qbJMfZfaQXwTVeFDA6cLSpXB
 DYlO3X2F6kM17Yop9Yz7I2djVw==
X-Google-Smtp-Source: AK7set+hAAmwhG0qmkRzO/CklR6OraOo9SohHvdKYsZldvZOvSiZ7wS8Xz3vklnI0N+2wYdUxvR9gw==
X-Received: by 2002:a17:902:ec8f:b0:19a:972a:7cb3 with SMTP id
 x15-20020a170902ec8f00b0019a972a7cb3mr7794092plg.60.1677955252778; 
 Sat, 04 Mar 2023 10:40:52 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:62b1:64d8:8207:f04e?
 ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 ky7-20020a170902f98700b0019608291564sm3635375plb.134.2023.03.04.10.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 10:40:52 -0800 (PST)
Message-ID: <a47572d2-fbdf-c0fd-aa13-db10d2e510d6@linaro.org>
Date: Sat, 4 Mar 2023 10:40:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/2] tcg: Merge two sequential labels
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "anjo@rev.ng" <anjo@rev.ng>
References: <20230303223056.966286-1-richard.henderson@linaro.org>
 <SN4PR0201MB8808029B619D052BBCDD8BC8DEB09@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB8808029B619D052BBCDD8BC8DEB09@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 3/3/23 16:27, Taylor Simpson wrote:
> You need this series of patches to see this pattern from Hexagon
> https://patchew.org/QEMU/20230131225647.25274-1-tsimpson@quicinc.com/
> 
> I have an update to that series for your tcg_temp_local_* series, but I'm wondering if I should wait for your tcg_temp_free patches to land first.  Please advise.

I'm hoping to get the tcg_temp_free patches in asap, as the potential conflicts are 
legion.  Thanks for the test pointer and quick review.


r~

