Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDCC33871C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:13:33 +0100 (CET)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKcvM-00024p-3r
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKctu-0001R5-H6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:12:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKcts-0002hP-60
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615536718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGuVoJ2Pflr7WqCqgfkZIlzhyrlDRD/JkcTbC7O4Cbo=;
 b=ZvfE7p2Zo5Z8QXZb3RAuNRb2Lbz3Rno8zgxFNXPUrlcN1PqQwwWK0Q/jPZIhAPyUnL0t0u
 E9JoF7H9faswExuahQRGFUSFQyDg0atYAIrpZOGgD3hSLJQO+aZ4VUbyhVVBwh/uOyYrPI
 DQjWa4DzQKnUmgkL8UTuZ0S8XM6faEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-vnpBco2KOhe1WVR42aFAyw-1; Fri, 12 Mar 2021 03:11:56 -0500
X-MC-Unique: vnpBco2KOhe1WVR42aFAyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DF1F100D675;
 Fri, 12 Mar 2021 08:11:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55E33369A;
 Fri, 12 Mar 2021 08:11:46 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
Message-ID: <651baead-dcc3-c0ef-f5dd-cda36c8d6599@redhat.com>
Date: Fri, 12 Mar 2021 09:11:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/2021 08.42, Marc-André Lureau wrote:
> 
> 
> On Fri, Mar 12, 2021 at 3:14 AM Philippe Mathieu-Daudé <philmd@redhat.com 
> <mailto:philmd@redhat.com>> wrote:
> 
[...]
>     +##
>     +# @AcceleratorInfo:
>     +#
>     +# Accelerator information.
>     +#
>     +# @name: The accelerator name.
>     +#
>     +# Since: 6.0
>     +##
>     +{ 'union': 'AcceleratorInfo',
>     +  'base': {'name': 'Accelerator'},
>     +  'discriminator': 'name',
>     +  'data': { } }
> 
>     +
> 
> 
> Making room for future details, why not.

I think we definitely need the additional data section here: For KVM on 
POWER, it would be good to know whether it's KVM-HV or KVM-PR, for KVM on 
MIPS it would be good to know whether it's KVM_VM_MIPS_VZ or KVM_VM_MIPS_TE, 
for KVM on x86 whether it's the AMD flavor or Intel, ...

>     +##
>     +# @query-accels:
>     +#
>     +# Get a list of AcceleratorInfo for all built-in accelerators.
>     +#
>     +# Returns: a list of @AcceleratorInfo describing each accelerator.
>     +#
>     +# Since: 6.0
>     +#
>     +# Example:
>     +#
>     +# -> { "execute": "query-accels" }
>     +# <- { "return": [
>     +#        {
>     +#            "type": "qtest"
>     +#        },
>     +#        {
>     +#            "type": "kvm"
>     +#        }
>     +#    ] }
>     +#
>     +##
>     +{ 'command': 'query-accels',
>     +  'returns': ['AcceleratorInfo'] }
> 
> 
> That's nice, but how do you know which accels are actually enabled?

I guess we need two commands in the end, one for querying which accelerators 
are available, and one for querying the data from the currently active 
accelerator...?

  Thomas


