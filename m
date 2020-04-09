Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC411A398F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 20:08:27 +0200 (CEST)
Received: from localhost ([::1]:53742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMbbG-0001sj-5A
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 14:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jMbaV-0001NQ-7K
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:07:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jMbaU-00058A-9V
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:07:39 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45985
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jMbaU-00057l-6Y
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 14:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586455657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXCBnU7UJOHa6Gspzz/90qm4ZL72G00Ha6GHxBF8hdE=;
 b=DTXfR/TSZ9P/1kbMYQx2Qltesh9azksM3MSEU6flaBCFIWEID0Yj9x/93fAUE5scdZAYli
 4BT/j7DbtTCJKWCeOXfZx9kCUZ9ymYj79z6G1tDCDQqy7giSacZuFNsW6PPzVH0LB9WGMk
 czLPdKaHpx7aZK6PeifLEHlmJeUr9fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-E9j4KqQkPtuwZL_UVnPGrA-1; Thu, 09 Apr 2020 14:07:33 -0400
X-MC-Unique: E9j4KqQkPtuwZL_UVnPGrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 743818017F6;
 Thu,  9 Apr 2020 18:07:32 +0000 (UTC)
Received: from [10.3.114.49] (ovpn-114-49.phx2.redhat.com [10.3.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C88D6EF86;
 Thu,  9 Apr 2020 18:07:31 +0000 (UTC)
Subject: Re: [PATCH for-5.1 4/8] qemu-option: Avoid has_help_option() in
 qemu_opts_parse_noisily()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200409153041.17576-1-armbru@redhat.com>
 <20200409153041.17576-5-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4f38f94d-5c7a-c00f-c7dc-8bc28de4fd39@redhat.com>
Date: Thu, 9 Apr 2020 13:07:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409153041.17576-5-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/20 10:30 AM, Markus Armbruster wrote:
> When opts_parse() sets @invalidp to true, qemu_opts_parse_noisily()
> uses has_help_option() to decide whether to print help.  This parses
> the input string a second time, in a slightly different way.
> 
> Easy to avoid: replace @invalidp by @help_wanted.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   util/qemu-option.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 

> -    opts = opts_parse(list, params, permit_abbrev, false, &invalidp, &err);
> +    opts = opts_parse(list, params, permit_abbrev, false, &help_wanted, &err);
>       if (err) {
> -        if (invalidp && has_help_option(params)) {
> +        if (help_wanted) {

Yep, that is cleaner.  Should there be testsuite coverage changing as a 
result of this?

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


