Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8FB5045EE
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 03:38:26 +0200 (CEST)
Received: from localhost ([::1]:48838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nftrs-0006D4-Ln
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 21:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nftqW-0005X1-Fu
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 21:37:00 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:36610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nftqU-00063y-Rp
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 21:37:00 -0400
Received: by mail-lj1-x234.google.com with SMTP id o16so13321003ljp.3
 for <qemu-devel@nongnu.org>; Sat, 16 Apr 2022 18:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hx1zPp59cLBCSzYmNlD0hZ1wg3obVMInPT7jmKvYWe4=;
 b=fqzpVP4cF0plezSqJZp77UyFnTbEI3Qqq/5IoCZ+exVssSJITRKooGIRjZFtlUvo50
 quFMRayevN/yKJmysxANlymZKiLzKriNTj9UwZaQki50rGnddFXBeZtKfszXkchUEXWA
 9b1fJGRowv168vLii0e1PAVDABxbGwnxq5TtREqkZwYz7NRH1wHOkQWvaRthBeTv03YI
 N1OsVHgAOV4rzdqDp6v/sGBDBzdKY7msKwckNgSWLlZb7oiq3vwzITJiBaJYGGoHCHH+
 iuglCewZ8LoBOw/DE6MrQ2T8HE7ZaclwuuDYI7/j54vd7/DhtCnOYT2l9/eLVvcsP7P6
 eT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hx1zPp59cLBCSzYmNlD0hZ1wg3obVMInPT7jmKvYWe4=;
 b=Qn+pGPlRR56mzJb/hyU7R4XumQtQvJUnu/zs4i88Zh9lJN5qlNr596TI+089c7MJ1a
 xbEEBoQMHGLWcd3CS23offC1yLUK7f2INEYmTe8Jfe9ZQMtPUBdCFrDu5MWNNSjDImFB
 xitPe6HWPkjkLl3CYdTeB2N3vFQvVgewc/8tLAmDmuu9dWgu49LoZD2Km0C/A5ACzJ7J
 CJq7z+PcBekKtljROiXMojlonIDHIZ+cVxbzeDPFgYS8OzZg8HaK/1jtGDESIwT2rjBx
 2V/4hv7nQK8sPPdvadonDjQom/PwoWZGqDjXDORZex9og2Etq/V5nwOr+SOadhNi2em9
 5Eqg==
X-Gm-Message-State: AOAM531SjCZ6aM/L1v3d+dobZzLrAx4I2kGpnggWSCup4CQ4i0we35Wj
 fMj7sW7kD/01VOWqK88OaJ9TOid8U53yltp3
X-Google-Smtp-Source: ABdhPJxMNtQnQZ0PcEND/qxANx/UdvXRiqqGbGdvAQstfLwd/d1upmoVCDXwnzuILxdjylVzcgNhNg==
X-Received: by 2002:a2e:8659:0:b0:24d:b379:4cc0 with SMTP id
 i25-20020a2e8659000000b0024db3794cc0mr1935565ljj.289.1650159415878; 
 Sat, 16 Apr 2022 18:36:55 -0700 (PDT)
Received: from localhost.localdomain ([5.3.190.55])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a198c46000000b0044424910c94sm826863lfj.113.2022.04.16.18.36.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 16 Apr 2022 18:36:55 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3] hw/misc: applesmc: use host osk as default on macs
Date: Sun, 17 Apr 2022 04:36:08 +0300
Message-Id: <20220417013608.22086-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220405004621.94982-1-t0rr3sp3dr0@gmail.com>
References: <20220405004621.94982-1-t0rr3sp3dr0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: t0rr3sp3dr0@gmail.com, Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Pedro Torres,

Please note this threads
https://patchew.org/QEMU/20211022161448.81579-1-yaroshchuk2000@gmail.com/
https://patchew.org/QEMU/20220113152836.60398-1-yaroshchuk2000@gmail.com/

There was a discussion about how to preserve
backward compatibility of emulated AppleSMC
behaviour. The discussion has stopped, but
if you're intended to see this feature working
within QEMU - it'd be good to cc all the
participans of previous threads :)


Thanks,

Vladislav Yaroshchuk 


