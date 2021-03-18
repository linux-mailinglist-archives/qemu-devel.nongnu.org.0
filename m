Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C8340E9B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 20:52:38 +0100 (CET)
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMyhA-0000Qw-96
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 15:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMyeq-0007yf-4h
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:50:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMyeh-0001Z1-AV
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616097001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qX9bn47uYp+Jz8jpXv8OoUVv0ykOs2WnbjzEvvBmG9I=;
 b=P4k5OliJkVu+Nrf/XY/bfLaa3eI+F/T/mOvMI+n+ICKpRSeeAbWzeQYk5BqN285GRwi7h+
 cD1QTSRUtW3hmgvydwl71AmSe8Syi7/sIQaYEdxD9+LzIQVxM7o8FxqC9CH7/2auTTS7iU
 WaQI1M2JDfaWuyA2mSe6WGsZAO7ktjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-g2A6RqIxNImCeL-F4VQJvg-1; Thu, 18 Mar 2021 15:49:56 -0400
X-MC-Unique: g2A6RqIxNImCeL-F4VQJvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93553190A7A0;
 Thu, 18 Mar 2021 19:49:55 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F5156C32F;
 Thu, 18 Mar 2021 19:49:55 +0000 (UTC)
Subject: Re: How to create vhdx differencing disk using qemu-img
To: qi zhou <atmgnd@outlook.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <ME3P282MB16654DBBEAE47620226F448DC9699@ME3P282MB1665.AUSP282.PROD.OUTLOOK.COM>
From: John Snow <jsnow@redhat.com>
Message-ID: <3585d6b8-a94e-bd2e-5a38-6ddfc2fe089d@redhat.com>
Date: Thu, 18 Mar 2021 15:49:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ME3P282MB16654DBBEAE47620226F448DC9699@ME3P282MB1665.AUSP282.PROD.OUTLOOK.COM>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 10:37 PM, qi zhou wrote:
> When I create vhdx differencing disk using qemu-img, It says
>   qemu-img: xxx.vhd Backing file not supported for file format 'vhdx'
> 
> The command I used is
> qemu-img create -f vhdx -b test.vhdx test-snapshot.vhdx
> 
> Here is my questions
> 1. Is vhdx format [full] supported by qemu ?

We support raw and qcow2 fully, read-write.

Everything else is "read-only", though write support might work, we 
don't encourage its use in production environments.

> 2. If not, is there any easy way to implement differencing disk of vhdx in qemu-img ?

the -b flag is generally for qcow2 files; I am not very familiar with 
VHDX but it appears as though we don't support it here.

I imagine it's 
https://www.altaro.com/hyper-v/hyper-v-differencing-disks-explained/ ?

I don't think we support those... ah, yeah, in block/vhdx.c:

typedef enum VHDXImageType {
     VHDX_TYPE_DYNAMIC = 0,
     VHDX_TYPE_FIXED,
     VHDX_TYPE_DIFFERENCING,   /* Currently unsupported */
} VHDXImageType;

> 3. Is there any other tools support vhdx on linux ?
> 

Not that I'm aware of, but I can't say I've looked before.


