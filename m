Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1F22D97F5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 13:28:25 +0100 (CET)
Received: from localhost ([::1]:38598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1komxk-0001jN-Bo
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 07:28:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1komwS-0001IX-8s
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:27:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1komwM-0000Go-7p
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607948815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kN9BmQuXSQ0jWZR18zjzm1m3IZjTTFFL3IxQX2jdZGk=;
 b=OVBesx8C5XfxIg/gTQ0V32XVkLxOnA9VUuiNnPrWwspTSTQFmqAKKQIwOS2GSM1h0yRMtv
 oS+1+WJ7FPS03s8Z6md3x8LYXKtIwY2alMT/R2Y4Q04XBLyqYOddu0VVsqIf1NEMAJIFtn
 TCOroFw6SCZ47cw8imnYAtCQRWutxe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-3go8KAzwM228G0DNohp8eQ-1; Mon, 14 Dec 2020 07:26:54 -0500
X-MC-Unique: 3go8KAzwM228G0DNohp8eQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E223180A086;
 Mon, 14 Dec 2020 12:26:53 +0000 (UTC)
Received: from gondolin (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D69052999A;
 Mon, 14 Dec 2020 12:26:48 +0000 (UTC)
Date: Mon, 14 Dec 2020 13:26:45 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] tests/acceptance: Extract the code to clear dmesg
 and wait for CRW reports
Message-ID: <20201214132645.7fbc4c16.cohuck@redhat.com>
In-Reply-To: <20201211173134.376078-2-thuth@redhat.com>
References: <20201211173134.376078-1-thuth@redhat.com>
 <20201211173134.376078-2-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 18:31:32 +0100
Thomas Huth <thuth@redhat.com> wrote:

> We will use this in more spots soon, so it's easier to put this into
> a separate function.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 30 ++++++++++++---------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index 864ef4ee6e..733a7ca24a 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -17,12 +17,24 @@ from avocado_qemu import wait_for_console_pattern
>  class S390CCWVirtioMachine(Test):
>      KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
>  
> +    timeout = 120
> +
>      def wait_for_console_pattern(self, success_message, vm=None):
>          wait_for_console_pattern(self, success_message,
>                                   failure_message='Kernel panic - not syncing',
>                                   vm=vm)
>  
> -    timeout = 120
> +    def wait_for_crw_reports(self):
> +        exec_command_and_wait_for_pattern(self,
> +                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
> +                        'CRW reports')
> +
> +    dmesg_clear_count = 1
> +    def clear_guests_dmesg(self):

<nitpick> Maybe clear_guest_dmesg? </nitpick>

> +        exec_command_and_wait_for_pattern(self, 'dmesg -c > /dev/null; '
> +                    'echo dm_clear\ ' + str(self.dmesg_clear_count),
> +                    'dm_clear ' + str(self.dmesg_clear_count))
> +        self.dmesg_clear_count += 1
>  
>      def test_s390x_devices(self):
>  


