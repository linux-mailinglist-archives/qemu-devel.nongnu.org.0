Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2168D33C6A0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:15:19 +0100 (CET)
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsgQ-0002Bf-49
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLsd8-00009q-4V
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLsd5-0004Nb-Gb
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615835510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zqu8BRLU4eVDgwL1HIyR+MCjOQ6eWuiUdFCxHnG/ts=;
 b=g3O7xX4mFn6MbDGqJzV1dt7tX4MMky5QszWC39j08bC2nO5D8/ZRKrvC941i1lfKSf4pLz
 eYKVaFIxr+JnWionNIOflLshXc0GCRiLCSHg6iT50gLhf4WlLZwGrNXsHQoj/pk4E4AkT8
 1VpLPY2VBHkJcHj4XRQbMxJ/rzD2NkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-PPYrYHTlPXebFrEZ91_HgA-1; Mon, 15 Mar 2021 15:11:47 -0400
X-MC-Unique: PPYrYHTlPXebFrEZ91_HgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1094887A82A;
 Mon, 15 Mar 2021 19:11:46 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0A935C3E0;
 Mon, 15 Mar 2021 19:11:45 +0000 (UTC)
Subject: Re: [PULL 1/1] utils: Use fixed-point arithmetic in qemu_strtosz
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210315185117.1986240-1-richard.henderson@linaro.org>
 <20210315185117.1986240-2-richard.henderson@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f2b73aa5-6d68-405f-82d4-e57d0ff23de0@redhat.com>
Date: Mon, 15 Mar 2021 14:11:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315185117.1986240-2-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 1:51 PM, Richard Henderson wrote:
> Once we've parsed the fractional value, extract it into an integral
> 64-bit fraction.  Perform the scaling with integer arithmetic, and
> simplify the overflow detection.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Message-Id: <20210315155835.1970210-2-richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

A bit late now that it's in a pull request, but adding

Fixes: cf923b783efd5 (utils: Improve qemu_strtosz() to have 64 bits of
precision)

would have been nice.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


