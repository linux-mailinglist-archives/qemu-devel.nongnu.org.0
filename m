Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C78D33DC00
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:03:49 +0100 (CET)
Received: from localhost ([::1]:55148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lME2m-00017N-8d
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMDVp-0004f6-MN
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMDVn-00040n-Br
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rpBEaMxOWm2clwXy6aplW1WF4Y9n84lR+f3+L0l+Lyo=;
 b=NWcJXfVYxlMPwLxS9LBzB7nNK6yhK6Dqy+eaG4MaRtU8ms1oIZ69ds8Y1QLGp/Qx+sahm1
 KSbgNi0zRcRm+owdEI6VHf5v3WgmdNOioWWEHfQe8ooVHL3D/eAQNATp5cWkF1XnGk8MLa
 jSPzwRKa5YX99x2ftB4cmkF8ewYr72M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-D_E_zOxSP4WKdzBSGrRSuw-1; Tue, 16 Mar 2021 13:29:41 -0400
X-MC-Unique: D_E_zOxSP4WKdzBSGrRSuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE05056B9D;
 Tue, 16 Mar 2021 17:29:39 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E26B1001B2C;
 Tue, 16 Mar 2021 17:29:33 +0000 (UTC)
Subject: Re: [PATCH v2 1/4] accel: Introduce 'query-accels' QMP command
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210316172449.3148634-1-philmd@redhat.com>
 <20210316172449.3148634-2-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6f87212e-d00f-751e-1a2c-1dd4950698dc@redhat.com>
Date: Tue, 16 Mar 2021 12:29:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316172449.3148634-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 12:24 PM, Philippe Mathieu-Daudé wrote:
> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
> 
> - Accelerator is a QAPI enum of all existing accelerators,
> 
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
> 

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Since v1: 'type' -> 'name' in comments
> ---
>  qapi/machine.json | 55 +++++++++++++++++++++++++++++++++++++++++++++++
>  accel/accel-qmp.c | 49 +++++++++++++++++++++++++++++++++++++++++
>  accel/meson.build |  2 +-
>  3 files changed, 105 insertions(+), 1 deletion(-)
>  create mode 100644 accel/accel-qmp.c
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 330189efe3d..610252fc25c 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1471,3 +1471,58 @@
>  ##
>  { 'event': 'MEM_UNPLUG_ERROR',
>    'data': { 'device': 'str', 'msg': 'str' } }
> +
> +##
> +# @Accelerator:
> +#
> +# An enumeration of accelerator names.
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'Accelerator',
> +  'data': [ { 'name': 'qtest' },
> +            { 'name': 'tcg' },
> +            { 'name': 'kvm' },
> +            { 'name': 'hax' },
> +            { 'name': 'hvf' },
> +            { 'name': 'whpx' },
> +            { 'name': 'xen' } ] }

Shorter, but semantically equivalent:
{ 'enum': 'Accelerator', 'data': [ 'qtest', 'tcg', ... ] }

I'd mention in the commit message body that we can't make the enum
values or union branches conditional because of target-specific
poisoning.  With that,

Reviewed-by: Eric Blake <eblake@redhat.com>

If we're trying to get it into 6.0, it is a new feature, and so we
should get it in a pull request before feature freeze today.  Otherwise
we'll have to s/6.0/6.1/

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


