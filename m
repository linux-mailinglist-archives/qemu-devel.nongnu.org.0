Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483E36FB6A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:26:56 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTAV-0003gH-Ca
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcT8A-0002IW-7p
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcT84-00024x-Uh
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619789064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4o14zuwoAQ13DqGqF7Yb6JAtvmoLeVYZ8N3cJVg3YI=;
 b=JUOr2O1ucQrUPT+WmhuUzj4h2lXhFWhvbfb99aC8/lzng0ddGSQPa3rpHmy9spdvMBcZ9Z
 Vo1Rf3QOvmbmJMPe+6qxLrp1hkxNt2u3cfc3E6hdRXUo/1Myxg7NjAgpnqMfX3annLDfhy
 v5vd/jLn3eg9QVk5Dcb0l1XBJ5raAT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-9r57SLIUOZmhFLdAVEhBnQ-1; Fri, 30 Apr 2021 09:24:22 -0400
X-MC-Unique: 9r57SLIUOZmhFLdAVEhBnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E0E2803F46;
 Fri, 30 Apr 2021 13:24:21 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40C5E17C76;
 Fri, 30 Apr 2021 13:24:16 +0000 (UTC)
Subject: Re: [PATCH v3 13/15] docs/devel/testing: add -valgrind option to the
 debug section of QEMU iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-14-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <287d4f6a-c045-ac2b-3c27-c48d1ea5b4e6@redhat.com>
Date: Fri, 30 Apr 2021 15:24:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-14-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   docs/devel/testing.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 2ee77a057b..62902cfd2d 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -236,6 +236,13 @@ given as options to the ``check`` script:
>     by setting the ``$GDB_QEMU`` environmental variable.
>     The final command line will be ``gdbserver $GDB_QEMU $QEMU ...``
>   
> +* ``-valgrind`` wraps a valgrind instance to QEMU. If it detects

Not a native speaker, but I think it should be “attaches ... to QEMU”, 
“wraps QEMU in a valgrind instances”, or “wraps ... around QEMU".

Apart from that:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +  warnings, it will print and save the log in
> +  ``$TEST_DIR/<valgrind_pid>.valgrind``.
> +  The final command line will be ``valgrind --log-file=$TEST_DIR/
> +  <valgrind_pid>.valgrind --error-exitcode=99 $QEMU ...``
> +  Note: if used together with ``-gdb``, this command will be ignored.
> +
>   * ``-d`` (debug) just increases the logging verbosity, showing
>     for example the QMP commands and answers.
>   
> 


