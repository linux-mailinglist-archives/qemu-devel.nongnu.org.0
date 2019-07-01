Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735C115838
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 05:49:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNr73-0000ql-2r
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 23:49:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anton@ozlabs.org>) id 1hNr62-0000D6-HZ
	for qemu-devel@nongnu.org; Mon, 06 May 2019 23:48:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anton@ozlabs.org>) id 1hNr61-0006s1-I4
	for qemu-devel@nongnu.org; Mon, 06 May 2019 23:48:50 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44915 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <anton@ozlabs.org>)
	id 1hNr61-0006mU-0c; Mon, 06 May 2019 23:48:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 44ylvY1fTSz9sB8;
	Tue,  7 May 2019 13:48:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
	t=1557200922; bh=2EnA5Hk9qFbX6Y6zzFRKgvxQEda1YVaxN0uuJBx3feo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wY2zqytiloqw4lAWOl9zwpwMh/kjkiOg2/3smQkVt01/DnwaWIyK//JPG6blf6d2X
	A3NWsUWR+T63SQdfZTKfrZIgV2u2kxPeuZgVS/32LCS+VWGYrMMW/Kh8xcO2QRa7Yk
	3eHYPXwavMXje7wqFJ8qu3QOQOSRilLenZrlravgV7r7paFZ6nswPAPYmLtgtiDdMv
	1VbHi1XHTg2m3L16RFC6KOXAZU1z2UM+3/qH/P7cS3O2Ra/PwiBw67h6WHn8V1AC/Z
	l0Dj3VZRGk7z+bSeQSuLZmYHJze/YvtCzZYthsnWx/EaPWrOZidU5ecO+sPbpNVrTS
	+UlZFnKzLmg2g==
Date: Tue, 7 May 2019 13:48:39 +1000
From: Anton Blanchard <anton@ozlabs.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20190507134839.3860d5ae@kryten>
In-Reply-To: <eea46cc5-a8d5-cef9-5197-db212272481f@ozlabs.ru>
References: <20190507004811.29968-1-anton@ozlabs.org>
	<eea46cc5-a8d5-cef9-5197-db212272481f@ozlabs.ru>
X-Mailer: Mutt/1.8.0 (2017-02-23)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH 1/9] target/ppc: Fix xvxsigdp
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ego@linux.vnet.ibm.com, sandipandas1990@gmail.com,
	richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, f4bug@amsat.org, qemu-ppc@nongnu.org,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alexey,

> Out of curiosity - how did you find this one and (especially) the next
> one - "Fix xxspltib"? Is there some testsuite, or by just looking at
> the code? Thanks,

I'm running test cases and comparing results between QEMU and real
hardware.

Thanks,
Anton

