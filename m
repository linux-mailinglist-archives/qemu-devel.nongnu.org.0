Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042B35E04
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 15:38:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYW7B-000309-EC
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 09:38:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hYW5Y-0002A5-8t
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:36:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hYW5X-0006aY-E2
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:36:24 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39567)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1hYW5X-0006Zm-7k
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 09:36:23 -0400
Received: by mail-ed1-x530.google.com with SMTP id m10so5838312edv.6
	for <qemu-devel@nongnu.org>; Wed, 05 Jun 2019 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XxCuyWvH/ZMOfnSDFTnwwPUG/3lD5TJMtC66xPu+ONs=;
	b=gn0bRosijdLrhQjmYtFWLHQqTAYUPV4jfvwKYATKAjGuMlgwX01nVVfdSeG1KUxei7
	n+BO0dqdWPhCt8duyj7FXvEstcR8MJftfBhuqzMUXd7uLedCyUZfEtM1qiSWBR+9+Tap
	4fipIS+yF1B18ZZ8Dd3VIkQJosZG/OoEpc9QDVGegaOxBFv6LSYfUFU3QgTCFu+vZKt8
	WeFfk3t1GLMbXMbu6MxgVkuIuYlIF7xfqPSi9uHRyOgmDdPngRXYZJw2mZHsaS2Nu/+1
	3rvo2gjRmuq+9GXRfvda3vXKJ9p5IhEtSu4BKp15UGETM2IgvBxKAyHeQqJuS+ffO4oX
	63tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XxCuyWvH/ZMOfnSDFTnwwPUG/3lD5TJMtC66xPu+ONs=;
	b=NF3RLj+qlmA3yoIrAlENBl8+1YGe+TJHRtStukjDg62EG+jULqxHJTd260jaVN/07F
	LgCaafnygTWI2qXo0lgdWBwaASznbta7YjdMyOL0c92V5icvB43Tup/JJULSSwIS/BGf
	fHeSJ4DTxGMAHFx1kBWENOrxUT6KMKafjq9qGxgPBGHu6a5rF/bxo8j+yq9YCMSEy/Ns
	2lzBImIgA/0TsgbydZypDzIV+n1Q5tJqOSvuhJtg0bkdvZQ5ZM7qSBdqgJG6rJPccF/v
	3IUMJ0ahFbBCQSWNMdoHv/6GnXQ8ZW/xfFJTBzcC0GpkbLooKpo0kC/UCKreqs6Ypd2V
	ZMGw==
X-Gm-Message-State: APjAAAXkDqtK3OSybmzcAZ7KXCciJa44ChW+qvnzMpfHXhs+7gTeswHg
	w/VfcF6kfrTzn1EmWxuEQt78SvxS
X-Google-Smtp-Source: APXvYqzrf1qXTzWuCQ3SPlXO/6+UuwW5l6vD/Zv0Pcce++tyBUxK1SyTtDsKlgMzZSGXNI4i6b+9AQ==
X-Received: by 2002:a17:906:448d:: with SMTP id
	y13mr35433357ejo.262.1559741782107; 
	Wed, 05 Jun 2019 06:36:22 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	j19sm3631279edr.69.2019.06.05.06.36.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Jun 2019 06:36:21 -0700 (PDT)
Date: Wed, 5 Jun 2019 13:36:20 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Philippe Mathieu-Daud?? <philmd@redhat.com>
Message-ID: <20190605133620.zf56y2swv67ymppx@master>
References: <20190605115318.9972-1-quintela@redhat.com>
	<20190605115318.9972-6-quintela@redhat.com>
	<60500aa5-856d-e754-3a4d-8d8b311087ca@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60500aa5-856d-e754-3a4d-8d8b311087ca@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::530
Subject: Re: [Qemu-devel] [PULL 5/5] migratioin/ram: leave RAMBlock->bmap
 blank on allocating
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 05, 2019 at 02:26:52PM +0200, Philippe Mathieu-Daud?? wrote:
>migratioin -> migration

Ah, you are right.

-- 
Wei Yang
Help you, Help me

