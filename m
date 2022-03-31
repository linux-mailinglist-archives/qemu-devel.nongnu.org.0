Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E9B4ED0F3
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:37:57 +0200 (CEST)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZip1-0006v9-UA
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:37:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZiVX-00064h-73; Wed, 30 Mar 2022 20:17:48 -0400
Received: from [2607:f8b0:4864:20::22d] (port=33368
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZiVV-0002ke-0v; Wed, 30 Mar 2022 20:17:46 -0400
Received: by mail-oi1-x22d.google.com with SMTP id k10so23801889oia.0;
 Wed, 30 Mar 2022 17:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rsq1IAvJMoHutkn6UtOA3YYe5qKvF3V+xrlBOYUzWB0=;
 b=L51mxJ3ul4VzESL5UHQKDBFuXROGLVw5eUMJjDY67AB+SM3xQmkUfKIdOUXiLE/coQ
 Eb9k35he7ZFtXaAvhJ/ORydpdqcsGmZIEP4/fGo/sl8Vyah8mtmo/bbJq+WkMJ6DY5y5
 oQZ+qxxC6t/YjEuepswYhjrMka4iWKf6JuqEhytL25Mpkg3MWot3gu6N6Ez4cg2a6Nrc
 AdmWrhxKUxo/CLMlp3U3MsE4WMe9WjGdsVVec1JVSg3qxAGuw/VWtYVr00coPRuthwMQ
 7u3e++/rSX/0OuL1UMX3fsKdTRLfUk5T8Z+0P8XAndqHrBdDrT0chm302wgBRij6W8C7
 Nb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rsq1IAvJMoHutkn6UtOA3YYe5qKvF3V+xrlBOYUzWB0=;
 b=3YdVmkPFcsR/3Cm/fpdkIOnAKdoT7kLKDyK7Xh7afh/vtk+MXeSOisH1q13a9YQWlx
 8KEGQOlzSJevj8mxhBE+jHkQL8k7s1N0HiyNCqCi0tIjkerHgL482CXTpf7uNz73NTxx
 Olm4bOs8u4fL5V0xRfptT+UNFy2hVdibgp6H/Y0JuY0Brc4lQyigevg9zx1uiFO1MFVI
 R40LfNsu13iuPKnK3aYI4Jmw7K5QWiUZzV4emPsljhgBnI1s7hHwiGwL9HmxejJYUyUP
 U7ACFKPSvmvsI0ktbrj8+YcG+TR6ean4j9d78wx2AWSfJx5laWhauchCWj/sANftD8sr
 cwQg==
X-Gm-Message-State: AOAM532wQ2rJtdlTlpXjFdhxEq2ZTEOnU3xpHb6vAW8mc/evceuuAdRo
 iuAeTAJaPipHKuu0TOY8PVEtoop/mUE=
X-Google-Smtp-Source: ABdhPJxMV634PM+v97k7iziI5ER9hUL55OVHM4uLxOI5c7lReyZacdTi5ig3IanD4uJKXW05xjKy1g==
X-Received: by 2002:a05:6808:1a93:b0:2da:59cc:7aff with SMTP id
 bm19-20020a0568081a9300b002da59cc7affmr1510993oib.142.1648685860887; 
 Wed, 30 Mar 2022 17:17:40 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 j126-20020acab984000000b002da77222b7dsm11149190oif.22.2022.03.30.17.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:17:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] ppc: valgrind "uninitialized values" fixes
Date: Wed, 30 Mar 2022 21:17:13 -0300
Message-Id: <20220331001717.616938-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v1:
- patch 1: init 'val' union in a single statement
- all patches:
  * added Philippe's R-b
  * changed initialization format from {0} to { }
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg07234.html

Daniel Henrique Barboza (4):
  target/ppc: initialize 'val' union in kvm_get_one_spr()
  target/ppc: init 'lpcr' in kvmppc_enable_cap_large_decr()
  target/ppc: init 'sregs' in kvmppc_put_books_sregs()
  target/ppc: init 'rmmu_info' in kvm_get_radix_page_info()

 target/ppc/kvm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.35.1


