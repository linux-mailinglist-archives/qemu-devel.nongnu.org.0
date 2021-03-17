Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A50133F424
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:57 +0100 (CET)
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYLw-0005vq-7h
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMY6B-00021B-2r
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:28:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMY66-0003cR-D0
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615994913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYIyOo0xjhKkPlkplxXUE9OnLLi4giDtusSSykhV3Vo=;
 b=ip6Sge3BAgilfRcnFjBakfAk9MPSlkl5XZ+kTf0Sdhm/Mvfzyvx0ufuIk5SP6qhZnEYhG7
 6so+q8I85hRN5LjPlvvDbQSBXKXJcNtbj139w7Y5T3JERD0VHK3xey4iNpGLWM3pOAok6b
 aSPplSt/Xi7GFfcy0T20J+6hzRc1KVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-sMK0wALAPUCk9JPdf2WPoQ-1; Wed, 17 Mar 2021 11:28:30 -0400
X-MC-Unique: sMK0wALAPUCk9JPdf2WPoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE80B108BD13;
 Wed, 17 Mar 2021 15:28:28 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BD535D9C0;
 Wed, 17 Mar 2021 15:28:28 +0000 (UTC)
Subject: Re: [PATCH 0/2] More qemu_strtosz fixes
To: qemu-devel@nongnu.org
References: <161599414593.29996.8944585512631660040@c9d4d6fbb2f1>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ed8fbb82-09f5-bdcf-9a69-6b3351b9cc25@redhat.com>
Date: Wed, 17 Mar 2021 10:28:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <161599414593.29996.8944585512631660040@c9d4d6fbb2f1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: berrange@redhat.com, thuth@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 10:15 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210317143325.2165821-1-eblake@redhat.com/
> 

> === OUTPUT BEGIN ===
> 1/2 Checking commit 81af63e53841 (utils: Tighter tests for qemu_strtosz)
> 2/2 Checking commit 36c9a8f42010 (utils: Work around mingw strto*l bug with 0x)
> ERROR: consider using qemu_strtol in preference to strtol
> #141: FILE: util/cutils.c:409:
> +        if (strtol(nptr, &tmp, 10) == 0 && errno == 0 &&
> 
> total: 1 errors, 0 warnings, 169 lines checked
> 

Intentional. This code is part of the implementation of qemu_strtol, and
we don't want infinite recursion ;)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


