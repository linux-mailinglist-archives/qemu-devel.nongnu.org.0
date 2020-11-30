Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B1A2C8F87
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 21:59:05 +0100 (CET)
Received: from localhost ([::1]:49234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjqGG-0006aR-2w
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 15:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kjqEE-0005b7-H4
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 15:56:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kjqEC-0005C2-6k
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 15:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606769814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jsoH/lkftcyDQH82XEulEMpXQr/Suxxt+BpV/Q+57Ag=;
 b=IdP9eIimIhvc6LWr6RwOp6K/778LJxxyA1bOS9qnRxhC71zRbthvPb9EytV1INvcG+l9v4
 RBW4HnWCwqmulA9hcgLljbrEb6jdPnZPp0Wx7bF0DjjAy8kho4EYdbzNvkqEwnnzcxvs3i
 oLugG//136Y0NI0iiqkFdNofdoujKWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-skU71VtDN7y-dpp8WeoOUA-1; Mon, 30 Nov 2020 15:56:53 -0500
X-MC-Unique: skU71VtDN7y-dpp8WeoOUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28B831F765;
 Mon, 30 Nov 2020 20:56:52 +0000 (UTC)
Received: from [10.10.119.122] (ovpn-119-122.rdu2.redhat.com [10.10.119.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9954810013C1;
 Mon, 30 Nov 2020 20:56:51 +0000 (UTC)
Subject: Re: [PATCH] qmp-shell: Sort by key when pretty-printing
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201013141414.18398-1-david.edmondson@oracle.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <27cc8383-89e1-5c5f-d8cf-7463810c1fd2@redhat.com>
Date: Mon, 30 Nov 2020 15:56:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013141414.18398-1-david.edmondson@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/20 10:14 AM, David Edmondson wrote:
> If the user selects pretty-printing (-p) the contents of any
> dictionaries in the output are sorted by key.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>   scripts/qmp/qmp-shell | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
> index c5eef06f3f..b4d06096ab 100755
> --- a/scripts/qmp/qmp-shell
> +++ b/scripts/qmp/qmp-shell
> @@ -260,7 +260,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>           indent = None
>           if self._pretty:
>               indent = 4
> -        jsobj = json.dumps(qmp, indent=indent)
> +        jsobj = json.dumps(qmp, indent=indent, sort_keys=self._pretty)
>           print(str(jsobj))
>   
>       def _execute_cmd(self, cmdline):
> 

Hi, out of curiosity, what does this help you accomplish?

I've recently been overhauling a LOT of the Python utilities we have, so 
I'm interested in hearing about how people use these tools and what 
they'd like them to do.

--js


