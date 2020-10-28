Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E409D29CFF9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 14:03:19 +0100 (CET)
Received: from localhost ([::1]:40112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXl6l-0007Nu-10
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 09:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kXl45-00064C-1Z
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 09:00:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kXl41-0002Jt-Cc
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 09:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603890027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jzWjtuk/3up8qX5sD2mvsXav3QiFhXqwhLcp0N+pAU=;
 b=MGPzUzDYOkIiq6LyJOrnEearv0ea6uvxxCuQ894s56tvcg38t01n53ohduNFdePizLI1FJ
 n1AXzOk0fEv95vtcMTrOnITTCC8YsBgD1kHJ2kK6fAn9sKJZxP5GigKkEigpxgKMe7kz4G
 vrqJNoUSTO6CB6XgE9GyeDfQb75zfNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-Z6NDmljfPmq8oxNFVuo2Xg-1; Wed, 28 Oct 2020 09:00:24 -0400
X-MC-Unique: Z6NDmljfPmq8oxNFVuo2Xg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 280B3809DED;
 Wed, 28 Oct 2020 13:00:23 +0000 (UTC)
Received: from [10.3.112.145] (ovpn-112-145.phx2.redhat.com [10.3.112.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8AF1C4;
 Wed, 28 Oct 2020 13:00:21 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1602182956.git.qemu_oss@crudebyte.com>
 <5f493b816595f0f6fe50a3f83e46432ab48d881b.1602182956.git.qemu_oss@crudebyte.com>
 <8c8c8cf1-ed97-3f27-2d0e-7440433169f7@redhat.com> <6217010.FX5ceaG2Km@silver>
 <11a4d5e3-cb5d-b74d-df7e-6e5a659c63a4@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v4 04/12] libqos/qgraph: add qos_dump_graph()
Message-ID: <4dde4915-8f44-d8fc-898f-bd61a40e084b@redhat.com>
Date: Wed, 28 Oct 2020 08:00:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <11a4d5e3-cb5d-b74d-df7e-6e5a659c63a4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/20 12:51 AM, Thomas Huth wrote:

>>>> +#define GREEN(txt) (  \
>>>> +    "\033[0;92m" txt  \
>>>> +    "\033[0m"         \
>>>> +)
>>>
>>> I don't think this is very portable - and it will only make logs ugly to
>>> read in text editors. Could you please simply drop these macros?
>>>

> Sure, colored output is nice, but we certainly also need a way to disable
> it, e.g. if you want to collect the log in a file and then have a look at it
> in a text editor.

Agreed. GNU libtextstyle
(https://www.gnu.org/software/gettext/libtextstyle/manual/libtextstyle.html)
is a much more portable way to do colored output where it becomes easy
to enable/disable or even adjust the colors to user preferences.  Sadly,
it is GPLv3+, and thus unusable for qemu.  But the bare minimum that you
must have when making colored output gated on whether stdout is a
terminal (that is, any program that does color should have a
--color=off|auto|on command-line option, and that in turn implies
function calls rather than macros to properly encapsulate the decision
logic.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


