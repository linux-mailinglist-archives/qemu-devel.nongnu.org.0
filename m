Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507BD23368A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 18:18:46 +0200 (CEST)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1BGX-0003WO-Eq
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 12:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k1BFn-00034N-UJ
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 12:17:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53249
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k1BFm-0001Ql-61
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 12:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596125877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IByMFqFydVtM3joiE43PRx6NeqGgFqhuLAdTdkmjDEs=;
 b=Ttn8UMdwfcpJ4cuU5TQY1/DVGkT5Ga9jsoKefXooWkZwJWcx7SaZnHFNnS9vKSDKgMkO8v
 wHeChYyFIFEPrZ3MwKdvbvdwy6/GwYQkye231dM9t06+Z6MbMQhCV6axlLQxTZ+w6tu+ip
 utppVGaeky9px+E9vBkIiZQd6XAy6Vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-ggXxUxgzM3-Jl7nd8orBWQ-1; Thu, 30 Jul 2020 12:17:55 -0400
X-MC-Unique: ggXxUxgzM3-Jl7nd8orBWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87104800461;
 Thu, 30 Jul 2020 16:17:54 +0000 (UTC)
Received: from [10.3.114.255] (ovpn-114-255.phx2.redhat.com [10.3.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EA3C79251;
 Thu, 30 Jul 2020 16:17:38 +0000 (UTC)
Subject: Re: [PATCH V1 07/32] savevm: QMP command for cprinfo
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
 <1596122076-341293-8-git-send-email-steven.sistare@oracle.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6f601210-55e8-d049-0ba7-eb20533aa841@redhat.com>
Date: Thu, 30 Jul 2020 11:17:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596122076-341293-8-git-send-email-steven.sistare@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:41:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/20 10:14 AM, Steve Sistare wrote:
> Provide the cprinfo QMP command.  This returns a string with a space-
> separated list of modes supported by cprsave, and can be used by clients
> as a feature test to check if the running QEMU instance supports cprsave.

When you've already got array support in the QMP language, why are you 
making the user parse a string into an array after the fact?

> 
> Syntax:
>    {'command':'cprinfo', 'returns':'str'}
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---

> +++ b/qapi/migration.json
> @@ -1623,6 +1623,15 @@
>     'data': { 'device-id': 'str' } }
>   
>   ##
> +# @cprinfo:
> +#
> +# Return a space-delimited list of modes supported by the cprsave command
> +#
> +# Since 5.0
> +##
> +{ 'command': 'cprinfo', 'returns': 'str' }

Returning a 'str' is non-extensible.  The fact that you had to edit the 
whitelist is proof that you should have done something better.  I recommend:

{ 'command': 'cprinfo', 'returns': { 'modes': [ 'CprMode' ] }

using the CprMode enum I proposed earlier.

> +
> +##
>   # @cprsave:
>   #
>   # Create a checkpoint of the virtual machine device state in @file.
> diff --git a/qapi/pragma.json b/qapi/pragma.json
> index cffae27..43bdb39 100644
> --- a/qapi/pragma.json
> +++ b/qapi/pragma.json
> @@ -5,6 +5,7 @@
>   { 'pragma': {
>       # Commands allowed to return a non-dictionary:
>       'returns-whitelist': [
> +        'cprinfo',

This should not be needed.  Design the return value correctly in the 
first place.

>           'human-monitor-command',
>           'qom-get',
>           'query-migrate-cache-size',
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


