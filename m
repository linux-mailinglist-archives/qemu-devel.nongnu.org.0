Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB452611D6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 15:12:36 +0200 (CEST)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFdQJ-0001fV-4S
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 09:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kFdP6-0000d6-N7
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 09:11:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22573
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kFdP4-00057U-8J
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 09:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599570676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ENhsyI3jak9xF7S3aYiepffHvD9VGYGOwwGW+Z8llfU=;
 b=VTb/J7mahOYBVFcKCZVAks8Sd2vAD4oSc31OQzAvLt5jiVn8OAUo9IgBCtFJdUcw7jRndM
 tZ623vsgC+kO2/AXWmki4d9dC4mqpN+zq7q21nrmA43dNJPYMETNmcXEkC0xGN9fJ3XInw
 CHmkMLa7OP2yxWXkQy//UBD//vUukv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-hhdgYoAXN_e7tzk2TM6BaA-1; Tue, 08 Sep 2020 09:11:05 -0400
X-MC-Unique: hhdgYoAXN_e7tzk2TM6BaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D18A18BA280;
 Tue,  8 Sep 2020 13:11:04 +0000 (UTC)
Received: from [10.3.112.176] (ovpn-112-176.phx2.redhat.com [10.3.112.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0116B60C0F;
 Tue,  8 Sep 2020 13:10:58 +0000 (UTC)
Subject: Re: [PATCH v3 05/15] iotests: update snapshot test for new output
 format
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <159903454714.28509.7439453309116734374.stgit@pasha-ThinkPad-X280>
 <159903457617.28509.2649326029575134141.stgit@pasha-ThinkPad-X280>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4dd00201-1adc-1085-76ef-d12608cd1cf6@redhat.com>
Date: Tue, 8 Sep 2020 08:10:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159903457617.28509.2649326029575134141.stgit@pasha-ThinkPad-X280>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.626, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, philmd@redhat.com,
 mtosatti@redhat.com, stefanha@redhat.com, armbru@redhat.com, mreitz@redhat.com,
 wrampazz@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/20 3:16 AM, Pavel Dovgalyuk wrote:
> From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
> 
> This patch updates iotests that verify qemu monitor output.
> New output format for snapshot listing include ICOUNT column.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   tests/qemu-iotests/267.out |   48 ++++++++++++++++++++++----------------------
>   1 file changed, 24 insertions(+), 24 deletions(-)

This should be squashed with the patch that altered the format, to 
reduce the chance of git bisect landing on a patch where iotests have a 
known failure.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


