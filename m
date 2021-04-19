Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BA364A6A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:20:09 +0200 (CEST)
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZRI-00074F-5O
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYYv4-0007qA-MB
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYYv3-0004qH-8D
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618858006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ypgkd6gTr1/2w3XXK+WylJg10TbzAEf4Uii63ZLuQAM=;
 b=ggzhU0p8C6HgdLjiwtuWMWb32jhb1w6JxbwskHKN2rt3BroQ10AxGOm5pIWPu81E0MlBRK
 mqIj6oKoTBR2aihjMkB48Hyz89Ip6qRK/jqPqGIYdNKtjx9DrbyjJEXepKbXUS+mxqoT7n
 sr068AjzmYSY/mJ/MDPVc/OdPS2GCxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-fEC4_G_bOiegm0jYEwYDww-1; Mon, 19 Apr 2021 14:46:43 -0400
X-MC-Unique: fEC4_G_bOiegm0jYEwYDww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8569A801814;
 Mon, 19 Apr 2021 18:46:42 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-102.gru2.redhat.com
 [10.97.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C179019809;
 Mon, 19 Apr 2021 18:46:24 +0000 (UTC)
Subject: Re: [PATCH 4/8] tests/acceptance/migration.py: cancel test if
 migration is not supported
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-5-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <f1ea2d3f-f7c8-694e-46e3-7f82abe860bf@redhat.com>
Date: Mon, 19 Apr 2021 15:46:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210415215141.1865467-5-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 4/15/21 6:51 PM, Cleber Rosa wrote:
> FIXME: check if there's a way to query migration support before
> actually requesting migration.
>
> Some targets/machines contain devices that do not support migration.
> Let's acknowledge that and cancel the test as early as possible.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/migration.py | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
> index 792639cb69..25ee55f36a 100644
> --- a/tests/acceptance/migration.py
> +++ b/tests/acceptance/migration.py
> @@ -53,7 +53,11 @@ def do_migrate(self, dest_uri, src_uri=None):
>           source_vm = self.get_vm()
>           source_vm.add_args('-nodefaults')
>           source_vm.launch()
> -        source_vm.qmp('migrate', uri=src_uri)
> +        response = source_vm.qmp('migrate', uri=src_uri)
> +        if 'error' in response:
> +            if 'desc' in response['error']:
> +                msg = response['error']['desc']
> +            self.cancel('Migration does not seem to be supported: %s' % msg)

My concern is about that cancellation actually covering up a real bug.

Cleber, have you seen the test failing on CI?

- Wainer

>           self.assert_migration(source_vm, dest_vm)
>   
>       def _get_free_port(self):


