Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A66B7906
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 14:32:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbiGz-0001pn-RX; Mon, 13 Mar 2023 09:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pbiGi-0001nV-2B
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:31:17 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pbiGg-0007O9-2x
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=R+cJDxXWS+vRs4USjS+lD4bFWd9LsB1ZFl2V8icmqjA=; b=w1BYrThx3fCsj78ouF8L+J54uF
 LrPW6CpBKa8Z9hsZ0INLZ7lH9e0ltGKj6nQff/F/Q1X8Dnw1kzkypTtZ617uZ5w2dAtBFbwQJQF6B
 nuWLLf7L3utYh5pG8f/UTseaz+03Ns+Y9Uzc/+KPyqcjzluqKXslTOv8YHDu4r30Fi9ygNfi5L1ts
 e0tqpvLebg3ig9msDilwOM8MzPKOIGnykOfptmjJWRNWx5PHTPYE7Nf44qY9xOcjNotyznwauUqo1
 dact+Lzon5Z3XjOt7FEEMowFWscBJbr4BNEcHkZ7qAHn02ytmigwhKJTSxcAXYSYz5uyx0cXpEgsb
 vTkS4hYX6pXvxnjrcD+bUbRURuFEay1w/CqDOXvqPiF7ZXRz/0U13CtKaEJteeHOAxyVI9t2Iw2pH
 3MyT+LCFY6kDdFG67sfD+0gaZs4JbIOFiDyXcdH50pghh0i+G3nG9+a0Ol85LJf5JV0Vd4E18ek0r
 YOlYIB6QIb70Ro2khIjlV9KCbeALRSRXvz5QTUkMK4jqcbecj189njGgn3UUjlGA5IHuUGPaM69Qc
 1IFgQBnoId9GJAK45Wwwyy/mDu03Dj/U5lXDBLg1VO4kWsBzetPzRhaaXbncrtpd/k6laCM/ITTOi
 X2HxkuHI745gkc83E+BMj08afujfcAMI4pznG1WOo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org
Cc: =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>,
 kraxel@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 wtaymans@redhat.com, qemu-devel@nongnu.org,
 Dorinda Bassey <dbassey@redhat.com>
Subject: Re: [PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Date: Mon, 13 Mar 2023 14:31:10 +0100
Message-ID: <3379148.aeAvL9zz9z@silver>
In-Reply-To: <CACzuRyyyt-L+iwFHOS3Tq5hQ9OToedyM79fmtKU3+X6KpUDSsw@mail.gmail.com>
References: <20230306171020.381116-1-dbassey@redhat.com>
 <64425814-c379-ef8f-b217-11d47f9f3bab@t-online.de>
 <CACzuRyyyt-L+iwFHOS3Tq5hQ9OToedyM79fmtKU3+X6KpUDSsw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Monday, March 13, 2023 2:11:11 PM CET Dorinda Bassey wrote:
> Hi Volker,
> 
> 
> > To hear this,
> > start QEMU with qemu-system-x86_64 -machine pcspk-audiodev=audio0
> > -device ich9-intel-hda -device hda-duplex,audiodev=audio0 -audiodev
> > pipewire,id=audio0,out.mixing-engine=off ...
> >
> I hear the clipped audio stream with these options. IMO, I don't think
> memset is responsible for that behaviour, I still hear the harsh sound with
> "-audiodev pa". I also tried using an alternative like:
> 
> @@ -117,7 +118,7 @@ playback_on_process(void *data)
>      }
> 
>      if (avail == 0) {
> -        memset(p, 0, n_bytes);
> +        p = g_malloc0(sizeof(n_bytes));
>      } else {
> 
> The clipped audio issue is still persistent.

Are you sure about sizeof(n_bytes) here? That's 4. ;-)

Volker's point was that "silence" is the center of the wave range. With signed
range that's zero, yes, but with unsigned range that's 2^(bitdepth) / 2.

So you need to memset() the correct value to generate "silence".

Best regards,
Christian Schoenebeck



