Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE9C691CA3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 11:25:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQQZA-0002cF-56; Fri, 10 Feb 2023 05:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQQYw-0002ap-Gf
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:23:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQQYu-0003bB-OI
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:23:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676024603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kLPdtHz2+v+pItG0TQSe3WkubOwiXDSavhSM18aP1tE=;
 b=P5wKgCL8LEHov8mHrClkKJAi+RZO5+TE/s34hWI2BOQXH0+C1OFdS1GxbLma7lRGPMjW65
 ftP2/QsEF7yf1HeIAk+3553k3Qfwnn4tZXORWQrXoFTTCidbVSCnZiZzNtw6Z77o79Zgt1
 GY6QujL70D8F7GK8JQpCAN/jN/QxX2I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-qqDbqyHvN9-oWA1_uZ5l1g-1; Fri, 10 Feb 2023 05:23:22 -0500
X-MC-Unique: qqDbqyHvN9-oWA1_uZ5l1g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD9FC100F908;
 Fri, 10 Feb 2023 10:23:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E39B492C3F;
 Fri, 10 Feb 2023 10:23:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 69CD921E6A1F; Fri, 10 Feb 2023 11:23:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  armbru@redhat.com,  eblake@redhat.com,
 eduardo@habkost.net,  berrange@redhat.com,  pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com,  mst@redhat.com, den-plotnikov@yandex-team.ru
Subject: Re: [PATCH v3 13/15] qapi: add HOTPLUG_STATE event
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-14-vsementsov@yandex-team.ru>
Date: Fri, 10 Feb 2023 11:23:20 +0100
In-Reply-To: <20230209200808.869275-14-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 9 Feb 2023 23:08:06 +0300")
Message-ID: <875yc9vmxz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> For PCIe and SHPC hotplug it's important to track led indicators,
> especially the power led. Add an event that helps.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  qapi/qdev.json       | 62 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/pci/pci.h | 15 +++++++++++
>  hw/pci/pci.c         | 33 +++++++++++++++++++++++
>  hw/pci/pcie.c        | 49 ++++++++++++++++++++++++++++++++++
>  hw/pci/shpc.c        | 42 ++++++++++++++++++++++++++++++
>  5 files changed, 201 insertions(+)
>
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 2708fb4e99..40dc34f091 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -158,3 +158,65 @@
>  ##
>  { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @HotplugLedState:
> +#

No documentation?

> +# Since: 8.0
> +##
> +{ 'enum': 'HotplugLedState',
> +  'data': [ 'on', 'blink', 'off' ] }
> +
> +##
> +# @HotplugPowerState:

No documentation?

> +#
> +# Since: 8.0
> +##
> +{ 'enum': 'HotplugPowerState',
> +  'data': [ 'on', 'off' ] }

Why not bool?

> +##
> +# @HotplugSlotState:

No documentation?

> +#
> +# Since: 8.0
> +##
> +{ 'enum': 'HotplugSlotState',
> +  'data': [ 'power-only', 'enabled', 'disabled' ] }
> +
> +##
> +# @HotplugState:
> +#
> +# @hotplug-device: hotplug device id
> +# @hotplug-path: hotplug device path
> +# @hotplug-slot: hotplug device slot (only for SHPC)
> +# @device: device name
> +# @path: device path
> +# @power-led: Power Indicator
> +# @attention-led: Attention Indicator
> +# @state: slot state, only for SHPC hotplug controller
> +# @power: Power Controller state, only for PCIe hotplug



> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'HotplugState',
> +  'data': { '*hotplug-device': 'str',
> +            'hotplug-path': 'str',
> +            '*hotplug-slot': 'int',
> +            '*device': 'str',
> +            'path': 'str',
> +            '*power-led': 'HotplugLedState',
> +            '*attention-led': 'HotplugLedState',
> +            '*state': 'HotplugSlotState',
> +            '*power': 'HotplugPowerState' } }

Too terse.

What do @hotplug-device and @device name?  Are these qdev-id?

What kind of paths are @hotplug-path and @path?  Are these paths to an
object device in the QOM tree?  Which object?

What's a @hotplug-slot?

> +
> +##
> +# @HOTPLUG_STATE:
> +#
> +# Emitted whenever the state of hotplug controller is changed.

Suggest "the state of hotplug controller changes."

Regardless, too terse.  What state changes exactly trigger the event?

> +# Only changed values are included into event.

"in the event"

Which values are included for each event trigger?

> +# Only SHPC and PCIe-native hotplug are supported.

Suggest something like "only ... provide this event."

Are parts of HotplugState specific to "SHPC and PCIe-native"?  Or asked
differently: when we make other kinds of hotplug send the event, what
would we need to change here?

> +#
> +# Since: 8.0
> +##
> +{ 'event': 'HOTPLUG_STATE',
> +  'data': 'HotplugState' }

[...]


