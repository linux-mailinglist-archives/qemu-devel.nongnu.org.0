Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4B76F5A82
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:57:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDur-0008TA-1U; Wed, 03 May 2023 10:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1puDuo-0008NB-EP
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:57:10 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1puDul-0003Vx-M2
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:57:09 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-517bb01bac9so3547840a12.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 07:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683125826; x=1685717826; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=QAx9Wguc+YDXqzvG3YSBFQh3D1E04k9Kbv5T8Rm6NUM=;
 b=TADUxA2Yca9lgbFCUEdaCOnqyfX1Y/3bthFAaRF4LI8LT9uZ2f/E8l6OzAyYA10Ur0
 YCZ7pYJrQmwmP+hYcFPnyxsGpIyuqEORCsBYt4Kzj2ZMm9io7KqbgiiX7xwPF4UciaHZ
 69F7o+8GgdqU8AY9VxXe8TtRBshd3GHH0/Luhp9fIIqSs9TYrLZovdUpf/Wjm3+uCVmV
 ppmtRYsdWHtMHMo53zZ5NY5sQLjB9OciD/w/RKT4NBFZJHOdJL8bgNNMbfX4oV0YCXqe
 HrP5dRF4F9iUCFO256knecspeN4c5wYy4QrJyxsB9dPc50HeqocXqKB2zoU2reIYnvEy
 DAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683125826; x=1685717826;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QAx9Wguc+YDXqzvG3YSBFQh3D1E04k9Kbv5T8Rm6NUM=;
 b=EryJJWrbdnndCqwpcaMi6CO27C4uJUszyY28cCdbxuRKltStGsuHnXzWCBBCmQPnP3
 bAe9L3bGe/nyWkhKy+AE1iIgjh9G9ScCkIgP5g0xvPTdL/Jt4SuN9nid3kk/vf8RYqEN
 I4H+MsmeuMxzvCmoSTb4kilNHc20g4/bhx5mwO2S4ZmNa6pVBJ9Bq5YM07sQyK1035BT
 LUqXdw9AEthAITIyLEou7BaozpBofgHydmWCR+1ASgWu0J5ammnVX2achtct4ZyZglWn
 UjwyFP4QRpsFHKiOdT23cz/YM7QXPAjtaRLhTYOtaGKMecfk5mQO9KIMzWjPhVTNIj55
 oGog==
X-Gm-Message-State: AC+VfDxU4dU4GRFyDLacxq0ocOB2HezmBwpiTz870ChIhaoCI6N5k53n
 VaWA0//qdBGHhrbwoi8kq8EsRcHDByzLgroZY6w=
X-Google-Smtp-Source: ACHHUZ62Z+i0HAhpFnIVTRC5LGnCiGRqpy4bkj0jKTTbRvW8yMo5c4XMBxvHReku8lf9PnZ3B7YO2g==
X-Received: by 2002:a05:6a20:438e:b0:ec:c8c2:36b7 with SMTP id
 i14-20020a056a20438e00b000ecc8c236b7mr5343404pzl.14.1683125825922; 
 Wed, 03 May 2023 07:57:05 -0700 (PDT)
Received: from localhost ([135.180.227.0]) by smtp.gmail.com with ESMTPSA id
 s1-20020a17090a1c0100b0024e11f31012sm1539471pjs.5.2023.05.03.07.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 07:57:05 -0700 (PDT)
Date: Wed, 03 May 2023 07:57:05 -0700 (PDT)
X-Google-Original-Date: Wed, 03 May 2023 07:57:03 PDT (-0700)
Subject: Re: [PATCH] linux-user: Add /proc/cpuinfo handler for RISC-V
In-Reply-To: <mvm354d4qh8.fsf@suse.de>
CC: laurent@vivier.eu, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-9b700e9c-d0cf-47ac-9ca9-bd9dc07d84d3@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 03 May 2023 04:13:55 PDT (-0700), schwab@suse.de wrote:
> On Mai 02 2023, Andreas Schwab wrote:
>
>> None of the currently defined cpus are non-GC cpus (except sifive_e, but
>> that is not suitable for user-space anyway), and there doesn't appear to
>> be any properties defined for changing the supported extensions.
>
> Actually, modifying the extensions is possible for the base cpus (rv32
> and rv64).

Ya, though I think you're right about the VA width in userspace.

