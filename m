Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D07586714
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 11:50:37 +0200 (CEST)
Received: from localhost ([::1]:56378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIS4K-0005AZ-Jm
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 05:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIRy9-0000HZ-W7
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 05:44:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIRy7-0005CI-H5
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 05:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659347046;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=aHw0WHUDjplHhyM2x7z49ozQEApYFi2qNDHdSE7wkJ4=;
 b=WNY064kZSpLgzMBnauLkGkHn27j/cODZCJZNcuIvI2YlaxZ/yszi28o+q0MjpoCBHo25Ji
 n9ZqXe0qrVIRe1L4Y1aBqZDL02okkujh2mltnm2wN1V+dIVZ+WrOo6XnYYZ3EA/O5NLtlC
 LJLhZzpHWMIOp5wAA7h1PyE8WVUyvgY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-3KpPCcEoPumwk4rFqeGBZA-1; Mon, 01 Aug 2022 05:44:05 -0400
X-MC-Unique: 3KpPCcEoPumwk4rFqeGBZA-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfba4c000000b0021e7440666bso2423857wrg.22
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 02:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:user-agent:reply-to:date
 :message-id:mime-version;
 bh=aHw0WHUDjplHhyM2x7z49ozQEApYFi2qNDHdSE7wkJ4=;
 b=YiGYA1AbOm6XjgdGVwFLarYcptmnBfCuyYEy21zoQ/JOaKpq1wPrCWhsRftS7fct+T
 bVzqfYD0FnhdCp8mtBX2+cYWzLG0Ti0elSFudlFZO+3PHQndr42znIfG6B+IsTvWpgbQ
 JQRO2OrS8s/Yj/Z11oPLAdNUL+wUKya4AbCkzEDH+sDQww7PSOAhDpzdvhZFUzcbBqff
 7dl1eH3Bn2McnjQzwNyaD7a9k5sQ8xU6D9Bp/QLFps28Vk5WI/nEU4VUg+mlrLLnudel
 A75Bu+I2FP2bLlD56iBILLOcSWjuvTxPrrRzDAp5jHgLx8yGIGyzUL8SKF5+OPEPS30s
 DNEA==
X-Gm-Message-State: AJIora/8rBBLfO/NOb5t7Vye97BPHDNQTGIU8v54sAmes1OWA5iqJsiY
 lWLsJc+WWbNyhJ8/OsbzzqKavEjk7KFX4rA1Rp+7nmyqAi6SyNAt+Me4H8/ygVdtxS0DR5Vx+cW
 qrnw/CTh5FUYeGXY=
X-Received: by 2002:a1c:4b09:0:b0:3a2:ff2a:e543 with SMTP id
 y9-20020a1c4b09000000b003a2ff2ae543mr10500438wma.93.1659347044593; 
 Mon, 01 Aug 2022 02:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tOagncrujq+bK70qRqYBSutzT/8BRPd7fNGfTgM7wU8qBQC97KTZWJIzcYDVMxIiQ91cEvow==
X-Received: by 2002:a1c:4b09:0:b0:3a2:ff2a:e543 with SMTP id
 y9-20020a1c4b09000000b003a2ff2ae543mr10500418wma.93.1659347044366; 
 Mon, 01 Aug 2022 02:44:04 -0700 (PDT)
Received: from localhost (84.125.93.75.dyn.user.ono.com. [84.125.93.75])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b003a3278d5cafsm20307562wmq.28.2022.08.01.02.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 02:44:03 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call for 2022-08-09
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 01 Aug 2022 11:44:02 +0200
Message-ID: <87k07scn8d.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Hi

Please, send any topic that you are interested in covering.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


