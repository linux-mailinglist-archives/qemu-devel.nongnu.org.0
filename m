Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58601B7846
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 16:28:14 +0200 (CEST)
Received: from localhost ([::1]:39596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRzJN-0004Wc-Sw
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 10:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRzI8-0003R9-L8
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:27:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRzI7-00075Z-NR
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:26:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58360
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jRzI7-00071I-AJ
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587738413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAhrcETvtbOnA/iZp39D0aOvc0h33L9z0ToMhfY/DMg=;
 b=HtRGiw0WGvCxOkyWdvx+u4HotNlPcv//wAMKUGPiqXzr3yCkDu/avMWp3xmmzBCz6M6hN1
 hoZnm1q+s6M/jXvIlVmpPY16Qsup5zu0xXU6pxlHcxTg1XlSe6Uez2MQ9VVKBS2JIHICpm
 0qemWPDhSHOCQuNUp8YcSUB02WgRCdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-TeSzTXaXOI6yRYdsWj1aiw-1; Fri, 24 Apr 2020 10:26:50 -0400
X-MC-Unique: TeSzTXaXOI6yRYdsWj1aiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 477FA462;
 Fri, 24 Apr 2020 14:26:48 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA9DF5D715;
 Fri, 24 Apr 2020 14:26:46 +0000 (UTC)
Subject: Re: [RFC PATCH 3/3] hw/net/tulip: Set descriptor error bit when
 lenght is incorrect
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200423231644.15786-1-f4bug@amsat.org>
 <20200423231644.15786-4-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b1efc0fc-c8e2-10ba-31d4-db4baf73ab34@redhat.com>
Date: Fri, 24 Apr 2020 09:26:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423231644.15786-4-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 03:54:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Prasad J Pandit <pjp@fedoraproject.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Li Qiang <pangpei.lq@antfin.com>,
 Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Ziming Zhang <ezrakiez@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/20 6:16 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> When a frame lenght is incorrect, set the RDES0 'Error Summary'

length (here, and in the subject)

> and 'Frame too long' bits. Then stop the receive process and
> trigger an abnormal interrupt. See [4.3.5 Receive Process].
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


