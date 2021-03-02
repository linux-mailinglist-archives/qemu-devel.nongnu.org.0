Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14815329608
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 06:17:31 +0100 (CET)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGxPV-0005Da-Gw
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 00:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lGxN3-0004Qj-Qx
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:14:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lGxMz-00018V-Es
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614662090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOnLxXggb+HXYoootW463t2yQ0UVxlkdOgHc/ThqstM=;
 b=S7iCGgZWXzV82Ia+C9Z3WqNBK9Ml/4duaKEWnQ/Z0G8zN0DkSgkmdeziDsusfNGgBiCPEZ
 NpDwJvufgWTlDLDlcjoF1Pg44Ppiy4EywMFlUzKh4rbhB+krNVNOKgZotgaG3slsTRPXb0
 vq7UB9FMlE2gAkIDdOkVRWBe4zggXqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-bd0yIlkePbKN00j_xVXxow-1; Tue, 02 Mar 2021 00:14:48 -0500
X-MC-Unique: bd0yIlkePbKN00j_xVXxow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 725821008304;
 Tue,  2 Mar 2021 05:14:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2784D19CBC;
 Tue,  2 Mar 2021 05:14:42 +0000 (UTC)
Subject: Re: CI with --enable-debug?
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <877dmrge9c.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6eed43d5-9ced-0b39-8528-b272930a706f@redhat.com>
Date: Tue, 2 Mar 2021 06:14:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <877dmrge9c.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/2021 15.06, Markus Armbruster wrote:
> Today I debugged why Paolo couldn't reproduce an assertion failure I
> found in review.  Turns out compiling with optimization masks it for
> both of us.
> 
> This made me wonder whether our CI tests with and without optimization.
> I quick grep finds --enable-debug in .travis.yml, but not in .gitlab*.
> Is this a gap?

When did you update your local repo the last time? There should be at least 
one --enable-debug in the gitlab CI now, see commit ac6d7074c0751f6.

If that didn't catch your problem, it's bad luck. With the slow shared 
runners, we currently cannot test each and every combination. But if you've 
got an idea where to add another switch, feel free to send patches.

  Thomas


