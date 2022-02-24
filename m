Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7084C2DDB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:06:54 +0100 (CET)
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNElh-0008MN-AP
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:06:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNEie-0006aH-47; Thu, 24 Feb 2022 09:03:44 -0500
Received: from [2a00:1450:4864:20::635] (port=42661
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nNEib-0006GG-VS; Thu, 24 Feb 2022 09:03:43 -0500
Received: by mail-ej1-x635.google.com with SMTP id hw13so4535933ejc.9;
 Thu, 24 Feb 2022 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/jGCVLi1nmUbrYZSPxRIwI5TohUd6OKgNJjkqRrCl9E=;
 b=ovG551HLK/v13zLHFp5RMIhBfq7spY9AfCioXXJyIFK9NVA2UoeYyNBQAIv/gU9xgr
 huVoarYgyBYRSRx/3FMSutRbtIUF23cqHVhPZTVGHI4rQGILN78rxk4i8LGrC0x55iTN
 QvtO4iTfXBgp2sThFK09RSY3ZhxfH6Ao7YU8iHEDj7HPMiGV6ZTJzipeBhGY8mgV1Iqh
 IavceggaEKwdkNYpI75lLRCvgGNoZOfliXiuKVITS977Z0N9tIxriKU/uPtueWaOzYAY
 tMecUHljVfE+CNLAEhplWxHnYLN1bH1Ss7bc6pQurU9+gFKdGSE4pjQunBM7PbyrsGQ5
 j5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/jGCVLi1nmUbrYZSPxRIwI5TohUd6OKgNJjkqRrCl9E=;
 b=CLkOthD8VhbsAtaz1/PNYMMXWfkpWYi10rKvWFh8S7RU0wV2X7mcihd2bDTCQh/LMH
 c0P1zdpVXVWW8A/OQdh+RDBjj39bKfqzniR8c9lvDCEUHqD80jt69i7bMsuF1Y7s3F1N
 MynSxKOuKaVkr9sD4bBa4XGeze2nvOHRT5y/GUPyb9SlyPjyaMmRqSSaHS3b/BDHA22z
 1cWce4CuLEtfBVIozDe0kKBWO3iS4myrKFichn2rya3H5XldLDEMF2YThdBzLo+QFb/K
 4EgaVI4sJJle5+TS+SiYKw/+LWilvhL13IAf5Mb6M8qp1O2ybkfFLF+FIA+KDyTjIG3+
 RA6A==
X-Gm-Message-State: AOAM533HjX3x90SG5gL9bCQSgiv35phDJ7ryRhqNKCCn2qZnBBZIkCec
 uCdXZJYyyEzIgbl3a3b32cQ=
X-Google-Smtp-Source: ABdhPJzLCXy+MwwWtB9Ds/sQBmYEtrZ4n5UAszHrs+gxqU1ovFFOk7C5r1kIzoJcpfelYgsdEGxs8A==
X-Received: by 2002:a17:906:8a98:b0:6b9:fe9:7be4 with SMTP id
 mu24-20020a1709068a9800b006b90fe97be4mr2357426ejc.521.1645711419705; 
 Thu, 24 Feb 2022 06:03:39 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id e15sm1443385ejk.3.2022.02.24.06.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 06:03:39 -0800 (PST)
Message-ID: <8586d924-28ca-580a-defd-cf307745be5a@redhat.com>
Date: Thu, 24 Feb 2022 15:03:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/4] Improve integration of iotests in the meson test
 harness
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20220223093840.2515281-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220223093840.2515281-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 10:38, Thomas Huth wrote:
> This way, we can now finally get the output of failed
> tests on the console again (unless you're running meson test in verbose
> mode, where meson only puts this to the log file - for incomprehensible
> reasons),

It's a bug (introduced by yours truly, which perhaps makes it less 
incomprehensible) and there's an open pull request to fix it.

Paolo

