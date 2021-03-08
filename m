Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7D9331731
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:25:02 +0100 (CET)
Received: from localhost ([::1]:59140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJLUz-0002sP-MN
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJLTd-0002FR-PK
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:23:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJLTb-0003lR-N2
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615231414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDEUX2FhMZgkFnaLBseU4rpy+kWwU9X7W/vRGMrdSu8=;
 b=W1qPFv/R9Myo42SjKayutJ/mBYh++X2Hkj5AVbt9JPhntbwRx4eB7eAJLWDLE96ROIq/SM
 m8hRm4xKUMjbrburTEY69g7FcERo3WuKs2Tg78BogAPHTwY+06C2YMfvNouXhG7BsrMJK4
 h1O6vtT60x8NoX/MJarrWzp42LKUFSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-GV8Fl_kiPF6n-D4OMDA5ig-1; Mon, 08 Mar 2021 14:23:24 -0500
X-MC-Unique: GV8Fl_kiPF6n-D4OMDA5ig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1051A19057AB;
 Mon,  8 Mar 2021 19:23:23 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97B9B6062F;
 Mon,  8 Mar 2021 19:23:15 +0000 (UTC)
Subject: Re: [PATCH v3 04/30] qapi/qom: Add ObjectOptions for cryptodev-*
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-5-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e6593923-b946-ac4f-1b27-9cbc4cc0881c@redhat.com>
Date: Mon, 8 Mar 2021 13:23:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308165440.386489-5-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 10:54 AM, Kevin Wolf wrote:
> This adds a QAPI schema for the properties of the cryptodev-* objects.
> 
> These interfaces have some questionable aspects (cryptodev-backend is
> really an abstract base class without function, and the queues option
> only makes sense for cryptodev-vhost-user), but as the goal is to
> represent the existing interface in QAPI, leave these things in place.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Acked-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  qapi/qom.json | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

> @@ -239,6 +267,9 @@
>      'authz-listfile',
>      'authz-pam',
>      'authz-simple',
> +    'cryptodev-backend',
> +    'cryptodev-backend-builtin',
> +    'cryptodev-vhost-user',

Shouldn't the enum value be conditional...

>      'iothread'
>    ] }
>  
> @@ -262,6 +293,10 @@
>        'authz-listfile':             'AuthZListFileProperties',
>        'authz-pam':                  'AuthZPAMProperties',
>        'authz-simple':               'AuthZSimpleProperties',
> +      'cryptodev-backend':          'CryptodevBackendProperties',
> +      'cryptodev-backend-builtin':  'CryptodevBackendProperties',
> +      'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
> +                                      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },

...if the union branch is likewise?

>        'iothread':                   'IothreadProperties'
>    } }
>  
> 

With that fixed,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


