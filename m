Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B324E697E90
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:40:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSIx9-0006od-1C; Wed, 15 Feb 2023 09:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pSIx5-0006lW-D4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pSIwx-0005qS-8m
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676471993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8gehqe1SksjhKg3uCG8qc896HfUUm2xUIOTA9u0DXE=;
 b=Bo5qmtVrsdOSvP+/rHDnQZ94C+jdL1s/SOor7pN+HcUIJfJdSbtgxcYQdj7D0fB4s/ys/f
 E7+V+6V4c8eh1X0zrJcxVa6J544hmJPXdZYpaacp//s0k/lGktTkTz3lbItrULGEHf3y/P
 1ftU3+lw7XIHAj40JId8RdSKY/0VBbo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-ev2CYVtaOVakPy3UVj-Evw-1; Wed, 15 Feb 2023 09:39:51 -0500
X-MC-Unique: ev2CYVtaOVakPy3UVj-Evw-1
Received: by mail-qk1-f197.google.com with SMTP id
 g22-20020a05620a13d600b00726e7ad3f44so11454608qkl.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A8gehqe1SksjhKg3uCG8qc896HfUUm2xUIOTA9u0DXE=;
 b=Kb7zeqUoHKE3aSaRbXwgOk5KrURZ0tqwAjsreGDmwr9iYfR74QEWP9W0R7UGge8sBx
 AV2+rjMBUUD16Ee3QJPlqr0J4AGD4uDRDwA6X7OvqvtCt+jzaMGzMcsnF87Z4tuz8t7G
 bSN5Rz2Tuugp/jYTi65FABY6tbRUA7QO8zQIdY4neMHTS7uWH4fYlP1y8e06Ajd4Jkx1
 OD7W2nqZFb3xlt4pUuAJz5xq1qDJacxG8rshUJtxgcA5pf2UtyIJ2+VnL3HGEYGZutq8
 Mn8GXKrKwUvoKCXtxalqb6wNy2oue1A4ra5MwRZBBnbHejVvUuNN4XYTw4FlmPIWNo3F
 6d2w==
X-Gm-Message-State: AO0yUKWm8s1mrc8b0y6bC3uJY7RDEy19W85/xg3ee2oNjRreWi+CRjqW
 10IStmNaQj1kdlKtP6dkg8Z0+AcMg2LwL9FUreBvUOZxbtzo3ReryZOkgwIusBeqNMQuOrksyi9
 EuALk8UNwTT/1T6D96zkc
X-Received: by 2002:ac8:5c89:0:b0:3b8:6c68:e6d with SMTP id
 r9-20020ac85c89000000b003b86c680e6dmr4987229qta.13.1676471990415; 
 Wed, 15 Feb 2023 06:39:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+Nl4iVO06lccpnz4Aou9ZMoDmoBky1ZD7zUDOZrMJQ5k9x8XBzz1AZbFHxOJ5fYxdA1usCtw==
X-Received: by 2002:ac8:5c89:0:b0:3b8:6c68:e6d with SMTP id
 r9-20020ac85c89000000b003b86c680e6dmr4987205qta.13.1676471990112; 
 Wed, 15 Feb 2023 06:39:50 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 x12-20020ac8700c000000b003b0766cd169sm13209068qtm.2.2023.02.15.06.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 06:39:49 -0800 (PST)
Message-ID: <ebbdc563-75b2-0f4e-6d47-0443c50a4310@redhat.com>
Date: Wed, 15 Feb 2023 15:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL 00/10] Net patches
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, Qiang Liu <cyruscyliu@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20230214061140.36696-1-jasowang@redhat.com>
 <CAFEAcA937Q=KqVNbKO_hDDNwzbcP7BD_DQFm-rhzKGKBCp1XGA@mail.gmail.com>
 <CAFEAcA-OAe3EMA6RwZEiL+o_2Q96TO=gZ+=Pu2rdhjWqW=k62Q@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CAFEAcA-OAe3EMA6RwZEiL+o_2Q96TO=gZ+=Pu2rdhjWqW=k62Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/14/23 15:30, Peter Maydell wrote:
> On Tue, 14 Feb 2023 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 14 Feb 2023 at 06:11, Jason Wang <jasowang@redhat.com> wrote:
>>>
>>> The following changes since commit f670b3eec7f5d1ed8c4573ef244e7b8c6b32001b:
>>>
>>>    Merge tag 'migration-20230213-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-13 11:54:05 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>    https://github.com/jasowang/qemu.git tags/net-pull-request
>>>
>>> for you to fetch changes up to e4b953a26da11d214f91516cb9b0542eab5afaa0:
>>>
>>>    vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-14 14:00:30 +0800)
>>>
>>> ----------------------------------------------------------------
>>>
>>> ----------------------------------------------------------------
>>
>> xlnx-can-test fails on multiple CI hosts:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3767000949
>> https://gitlab.com/qemu-project/qemu/-/jobs/3767000974
>> https://gitlab.com/qemu-project/qemu/-/jobs/3767000994
>> https://gitlab.com/qemu-project/qemu/-/jobs/3767000970
>> https://gitlab.com/qemu-project/qemu/-/jobs/3767001009
>> https://gitlab.com/qemu-project/qemu/-/jobs/3767000851
>> https://gitlab.com/qemu-project/qemu/-/jobs/3767000849
> 
> more specifically, it asserts:
> 
> ERROR:../tests/qtest/xlnx-can-test.c:96:read_data: assertion failed
> (int_status == ISR_RXOK): (0 == 16)

It seems the problem is with the loopback test (net/can/can_loopback).

as fifo32_num_used() and fifo32_num_free() return the number of uint32_t slots, the patch 
should be fixed with (remove the "4 *"):

diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
index 55d3221b4980..8a56734b3ca2 100644
--- a/hw/net/can/xlnx-zynqmp-can.c
+++ b/hw/net/can/xlnx-zynqmp-can.c
@@ -451,7 +451,7 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
      }

      while (!fifo32_is_empty(fifo)) {
-        if (fifo32_num_used(fifo) < (4 * CAN_FRAME_SIZE)) {
+        if (fifo32_num_used(fifo) < CAN_FRAME_SIZE) {
              g_autofree char *path = object_get_canonical_path(OBJECT(s));
              qemu_log_mask(LOG_GUEST_ERROR, "%s: data left in the fifo is not"
                            " enough for transfer.\n", path);
@@ -470,7 +470,7 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
               * that it transmits.
               */
              if (fifo32_is_full(&s->rx_fifo) ||
-                    (fifo32_num_free(&s->rx_fifo) < (4 * CAN_FRAME_SIZE))) {
+                    (fifo32_num_free(&s->rx_fifo) < CAN_FRAME_SIZE)) {
                  ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOFLW, 1);
              } else {
                  for (i = 0; i < CAN_FRAME_SIZE; i++) {


Thanks,
Laurent


