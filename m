Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCAC307375
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 11:15:00 +0100 (CET)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l54KJ-0006Ao-7w
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 05:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l54J1-0005N4-6M
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:13:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l54Iy-0000Qh-88
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611828814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjP71+jsSHg5jp8oeqljYkLF7YS95pnms8NUNb0XHEs=;
 b=COQFk0WJkvYBV4Lswk55dn/Gq4mC+fEGeiZYcCROP8H17OY31r+jjz3CZEM2EQuY3sH4+L
 fUTNArGdD6WZqax7dXMzbwxZd9gMyhivTMAMJ10tWhP1R1b4dCZ0rZm7DvdVnVtmOkr6+E
 nblXsxbPwMuNL3GutFfa1uNlkJkwIxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-KmHYL0udPk--l1dcEqRqmg-1; Thu, 28 Jan 2021 05:13:30 -0500
X-MC-Unique: KmHYL0udPk--l1dcEqRqmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 765E0801B17;
 Thu, 28 Jan 2021 10:13:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F86310027A5;
 Thu, 28 Jan 2021 10:13:28 +0000 (UTC)
Subject: Re: [PATCH 2/5] libqos/qgraph_internal: add qos_printf() and
 qos_printf_literal()
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1611704181.git.qemu_oss@crudebyte.com>
 <653a5ef61c5e7d160e4d6294e542c57ea324cee4.1611704181.git.qemu_oss@crudebyte.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <834a4045-1e13-95d7-a6fb-0fb47d14b2d7@redhat.com>
Date: Thu, 28 Jan 2021 11:13:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <653a5ef61c5e7d160e4d6294e542c57ea324cee4.1611704181.git.qemu_oss@crudebyte.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/01/2021 00.04, Christian Schoenebeck wrote:
> These two are macros wrapping regular printf() call. They are intended
> to be used instead of calling printf() directly in order to avoid
> breaking TAP output format.
> 
> TAP output format is enabled by using --tap command line argument.
> Starting with glib 2.62 it is enabled by default.
> 
> Unfortunately there is currently no public glib API available to check
> whether TAP output format is enabled. For that reason qos_printf()
> simply always prepends a '#' character for now.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   tests/qtest/libqos/qgraph_internal.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/tests/qtest/libqos/qgraph_internal.h b/tests/qtest/libqos/qgraph_internal.h
> index 974985dce9..c0025f5ab9 100644
> --- a/tests/qtest/libqos/qgraph_internal.h
> +++ b/tests/qtest/libqos/qgraph_internal.h
> @@ -255,4 +255,15 @@ void qos_delete_cmd_line(const char *name);
>    */
>   void qos_graph_node_set_availability(const char *node, bool av);
>   
> +/*
> + * Prepends a '#' character in front for not breaking TAP output format.
> + */
> +#define qos_printf(...) printf("# " __VA_ARGS__)
> +
> +/*
> + * Intended for printing something literally, i.e. for appending text as is
> + * to a line already been started by qos_printf() before.
> + */
> +#define qos_printf_literal printf

I'd maybe rather name it qos_printf_append ... but that's just a matter of 
taste.

Reviewed-by: Thomas Huth <thuth@redhat.com>


