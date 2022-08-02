Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F358825D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 21:16:30 +0200 (CEST)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIxNU-0002h4-SQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 15:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIxKF-0000Ao-FI
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 15:13:08 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIxKD-0002kI-Fe
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 15:13:07 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 x2-20020a17090ab00200b001f4da5cdc9cso9312895pjq.0
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 12:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e+RU//5WKIzkMZhiseBDzwmgMndV5CwR/Znz76OecUc=;
 b=KZkf5HUVcBUUkhNrU6OZO634HgEC74m2xN+g6LXe1AgKHkXRecptFhf4fM2gQ7N5xQ
 nG+5dHMbo7JjuWmSdeCQsVE/8ze1GZ4D3maEw+jWG1P0gUaoB0jKqislEte1h+6Jk3u4
 gsIuu8I5ZOv7GAivuR2+Qyvw854JraADKRhWT2S9aYPWPoNZ7B1VGPl+YicaD+R9Yd2O
 mt0CkxlvpF0P3HgAdKZ040zZ8ta93SAHTfWBLW94qcyxFkjoaPAH0mmsvhjW98/sNoE9
 BJEYKnriE7RUghMirul4CCb9V8EUPocv8JC38oafWMA2MuJ6YeGcq7Jvr/uWSt4N1NkZ
 Oq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e+RU//5WKIzkMZhiseBDzwmgMndV5CwR/Znz76OecUc=;
 b=QBtqLNXJp2g2FNLy1pI+UTsqkFOUUF7LJ0hbHHGLy31KUjtcNbesIw9i8/5/FBOR55
 t3iuXHCYOJ1xEyr+wba06nD8AckEMPSxSuXc8zV8zI/VQgrkD5R85Nem9TXtF9EXeNNr
 XorodetS8GQSxDwJqSaTZu/D6zpeu6gbuFdK+VwQ1B1f0Za9E3kx9kRGCU68pSMqQeu7
 tuTJB2b1eksKyItn185bWkrTKPOe7mCo9XuZ1c0DzxXI8VKuu+4a4yU8LmZZoEFTTCB1
 eGlL/dDG4dsvGDiMHKDzpVDUp3Vw1YRa6m3bMKhs8R0+hZhBj2sdiI2T7YvtW4rUP8ap
 /lHw==
X-Gm-Message-State: ACgBeo0fgBDCapqr2v2LiVfA8FF2Q7LOSWxyavWLuwXyMO8k2ac9+EVd
 B67rTv1IPWdZP6lerFWfSEy9fQ==
X-Google-Smtp-Source: AA6agR6N9/tnSYwLi7rkNG7XmCp3mbs3pqZz77L/q0lcBn+0tCSxIQUlDVQtMyUm8ifLfkwFojCFKQ==
X-Received: by 2002:a17:90a:e7c7:b0:1f2:bea3:37df with SMTP id
 kb7-20020a17090ae7c700b001f2bea337dfmr944164pjb.133.1659467580549; 
 Tue, 02 Aug 2022 12:13:00 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:9b48:8d61:390d:9808?
 ([2602:ae:1549:801:9b48:8d61:390d:9808])
 by smtp.gmail.com with ESMTPSA id
 w127-20020a623085000000b0052df34124b4sm1489282pfw.84.2022.08.02.12.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 12:12:58 -0700 (PDT)
Message-ID: <9ce64cd3-22c6-13a6-b36a-cac40e3a7a98@linaro.org>
Date: Tue, 2 Aug 2022 12:12:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/5] migration queue
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, leobras@redhat.com, thuth@redhat.com,
 peter.maydell@linaro.org, vgoyal@redhat.com
Cc: peterx@redhat.com, quintela@redhat.com
References: <20220802155447.216018-1-dgilbert@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220802155447.216018-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/2/22 08:54, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit 0399521e53336bd2cdc15482bca0ffd3493fdff6:
> 
>    Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (2022-08-02 06:52:05 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220802c
> 
> for you to fetch changes up to a21ba54dd5ca38cd05da9035fc65374d7af54f13:
> 
>    virtiofsd: Disable killpriv_v2 by default (2022-08-02 16:46:52 +0100)
> 
> ----------------------------------------------------------------
> Migration fixes pull 2022-08-02
> 
> Small migration (and virtiofsd) fixes.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> ----------------------------------------------------------------
> Leonardo Bras (1):
>        migration: add remaining params->has_* = true in migration_instance_init()
> 
> Peter Maydell (2):
>        migration: Assert that migrate_multifd_compression() returns an in-range value
>        migration: Define BLK_MIG_BLOCK_SIZE as unsigned long long
> 
> Thomas Huth (1):
>        Revert "migration: Simplify unqueue_page()"
> 
> Vivek Goyal (1):
>        virtiofsd: Disable killpriv_v2 by default
> 
>   migration/block.c                |  2 +-
>   migration/migration.c            |  5 +++++
>   migration/ram.c                  | 37 ++++++++++++++++++++++++++-----------
>   migration/trace-events           |  3 ++-
>   tools/virtiofsd/passthrough_ll.c | 13 ++-----------
>   5 files changed, 36 insertions(+), 24 deletions(-)
> 
> 


