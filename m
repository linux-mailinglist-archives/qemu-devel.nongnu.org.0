Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167C155E552
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:27:18 +0200 (CEST)
Received: from localhost ([::1]:45456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6CBR-0006z0-7E
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6CAU-0006Cy-U7
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6CAS-0005Dz-SH
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656426376;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnhT6keobuGL7OTU7UojVOzVZg8dwUoj0lCn95ykWvI=;
 b=N+LssMncbHTBml1lSRKRCwx1Z10yYtbaU3CvbSjR8v3uwySLHnp2DfJbuM7sb9KhV38NPl
 52aEEG2c/aUh+2y7/1OwHlktnSBKOf/VJIyr4pGMcuN10YuCrUfuEZt0+j/zev6HqvYtG8
 imYQbO7ldFuMOTKnoejBXFe8EdPdgXw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-w76o7UO-MaegrGxJpz0CJA-1; Tue, 28 Jun 2022 10:26:14 -0400
X-MC-Unique: w76o7UO-MaegrGxJpz0CJA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A90F7803520;
 Tue, 28 Jun 2022 14:26:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0092492CA3;
 Tue, 28 Jun 2022 14:26:13 +0000 (UTC)
Date: Tue, 28 Jun 2022 15:26:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 0/2] python/qemu/machine: fix potential hang in QMP accept
Message-ID: <YrsPg4JhLwpieuBQ@redhat.com>
References: <20220628134939.680174-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628134939.680174-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 05:49:37PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> As reported earlier by Richard Henderson ("virgl avocado hang" thread), avocado
> tests may hang when QEMU exits before the QMP connection is established.
> 
> My proposal to fix the problem here is to do both accept() and wait()
> concurrently by turning some code async. Obviously, there is much larger
> work to be done to turn more code into async and avoid _sync() wrappers, but
> I do not intend to tackle that.

IIUC, in this case the Python API has a listener socket, and QEMU is
the client socket. As you say this has a possible designed in hang
since there's not a good way 100% sure whether a client connection is
still pending or not. The plus side is that it means that QEMU should
die when the parent python app goes away and the server end of the
monitor FD closes.

The startup race though could be avoided by using FD passing with a
reversed relationship. ie Python opens a listener socket, and passes
the pre-opened FD to the forkd QEMU process. The python can connect()
and be confident that either connect will (eventually) succeed, or
it will definitely get a failure when QEMU exits (abnormally) because
the pre-opened listener FD will get closed.

There would need to be another means of ensuring cleanup of QEMU
processes though. Probably QEMU itself ought to support a flag to
the monitor to indicate that it is "single connection" mode, such
that when the first client terminates, QEMU exits

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


