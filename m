Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F98B40F465
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:47:16 +0200 (CEST)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9Wd-0006Se-24
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mR9NF-0004q9-71
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mR9NC-00016w-Bo
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631867849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ly/gusIckYI0I5dCCJUvU1esdCREVIUBaXMwvw6uLoo=;
 b=daUWSt9c7029yA0hZrAWiBMs1AEuU5IghMdbSHXLNKpgk7V+BtRqF2p3m85JJTFZcuFbeU
 oUgHSZixWUDCtZCIecCzU1T8ZXrg09t5oWB9tVwjn7JD4k0rrvG5qlub9F5QGmYye3etoa
 FGptkyrz1YmT9P+U7cTuhKi2DJJsmds=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-7Q-3vqrXNeqVJhphUoeFcA-1; Fri, 17 Sep 2021 04:37:28 -0400
X-MC-Unique: 7Q-3vqrXNeqVJhphUoeFcA-1
Received: by mail-wr1-f71.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso3439344wrn.19
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 01:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ly/gusIckYI0I5dCCJUvU1esdCREVIUBaXMwvw6uLoo=;
 b=5/gZBNBm1Re+kOE0T9RQ3LUhNuvIV9ROMZ9Cwmc1H32PbSsZHp7raJThjFb9pQXH+5
 310iV/b3K9AhnryV/wohPAwUQtjbtcMD4+zZxWL09YuJ/vw1GagG1r6urL8hLTnNBbCR
 VaXhf/k+nBeqF7Xquhil6/18/fL6DGf+AdLt/yDey0O1tTluxHt2+zLPwr3IXeKH60nA
 dlL/Mo4sqzESAyGhGLCXniND1rnCn5jTdxdhXSt7A8TOK1WpBHY6R0GvpZrlAAvsGP6c
 2AzNDR3sQbcg2tSvo2g/XTWMNE6NRx2Yybz2Nrkzc9QeVSyiuHxYckmaIzcDKitMtLBu
 tPUA==
X-Gm-Message-State: AOAM531LqFiL3isbobU/+faClnH1F7hb7/NEfHBYHgVI7HBz1xumdzWK
 KdHsQqls6hFp9dvlY2k2wkEZ8j7oV87MbgrjW+lc5VFoaT/lmx5puYLBgxCX0ALTlkkeKOM0KK2
 0NVFh9KPlQ57IZ5o=
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr10548819wrc.162.1631867847519; 
 Fri, 17 Sep 2021 01:37:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVBLkAECDpn0wG00v+XFKSw8BWQHE8VUkCf6uOHTQdN8Djis2uKXP83+f1qTzZz1YZc5D1cw==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr10548786wrc.162.1631867847222; 
 Fri, 17 Sep 2021 01:37:27 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id l21sm5547445wmh.31.2021.09.17.01.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 01:37:27 -0700 (PDT)
Subject: Re: [PATCH v3 03/16] iotests/migrate-bitmaps-postcopy-test: declare
 instance variables
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-4-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <5d44034d-d629-95cb-4a54-8e2785d94439@redhat.com>
Date: Fri, 17 Sep 2021 10:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-4-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> index 00ebb5c251..9c00ae61c8 100755
> --- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> +++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> @@ -115,6 +115,9 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
>           self.vm_a_events = []
>           self.vm_b_events = []
>   
> +        self.discards1_sha256: str
> +        self.all_discards_sha256: str
> +
>       def start_postcopy(self):
>           """ Run migration until RESUME event on target. Return this event. """
>           for i in range(nb_bitmaps):

Isn’t this obsolete after e2ad17a62d9da45fbcddc3faa3d6ced519a9453a?

Hanna


