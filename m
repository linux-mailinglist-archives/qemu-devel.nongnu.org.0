Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1592CBE69
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:35:51 +0100 (CET)
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkSIQ-0002zL-IR
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkSG0-0002B2-4R
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:33:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkSFy-0005Zf-Ji
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606915997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNMIbKpYxbBD+9IuDcNFh0gq7g4UQsjlYsiDAItkYQI=;
 b=L3eCLUiV+rjxgzCf2xDwF6nArAfBmIRAucSWw/4dPKCIvz7jyYDrLDDTxvjcMl9VQiwhyS
 GxsHdngmVUKlQBtsjToX064bJBxSwRLsXmLUg0MpSd3G52B4dSs2qcbHgT+pEIuYu6oLWS
 ONPd9U6/KU/32BCjYlnK/WcUz+3Md5E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-uZcqBtkhMiu7yBCQl6hMjw-1; Wed, 02 Dec 2020 08:33:16 -0500
X-MC-Unique: uZcqBtkhMiu7yBCQl6hMjw-1
Received: by mail-ej1-f71.google.com with SMTP id z10so3134335eje.5
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 05:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IqD1KAVlz7DGV/veiuVmjO9+BAkp+fpXNiLLjXvZpoQ=;
 b=TOW6wDz+ELSHjrrwn+uEdyR6AqWok0z2U1EI0kjMhRNtUlkPl+LIu4HqftjMTmSYzQ
 y8USGWi2Chm+HHvtqoP4oOAx4bucRocSFRGhQ5pwcYjEAPmJtYqXkwqmyq/JhC1FcFsM
 5T6NSyUc+/K1ookN84YLz+WqTrKw9d2PzOJPGOZQo+j7hjVLAhqsSWILyGpF+Y+ysaa/
 uoiCnqdaLckcvaIJq9U3V1lHkFPnz6n9nA1Yuo0ZKl0eDXyxnx/S4rvB1RP0ZOzPnc2o
 kmt4aaTtpjDV9XkEyAx36o2cPXkPE08QjVBFPMNNLfEtnranR3WmWTqettEjwAhzUTGo
 DMyA==
X-Gm-Message-State: AOAM5334yGk2tgmfr1ak9NsMEJi7dNQeB4pyny3D00zHaFCfnFtneuth
 +S5KjnqqOxgQn8oqdwPtvVSjycHtrRlMCMxhItgiLH4UvZn/ZIc/luJdgX1lsvdRC/bUUe2oa4l
 1/QqSDmMRxTBVHMVemmnBFcXYA2goeS4DQaea2cVr0KNA3UliQ6vOGibZAmia0ZvKiE4=
X-Received: by 2002:a50:955b:: with SMTP id v27mr2519334eda.324.1606915989978; 
 Wed, 02 Dec 2020 05:33:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkKwsvaeFlqXlt9WYCG4MyEWUiTdnp+ZTOQcN+JzuZiH8N8hPGzcj88iiQw9dJTNX/xUjGjA==
X-Received: by 2002:a50:955b:: with SMTP id v27mr2519168eda.324.1606915987875; 
 Wed, 02 Dec 2020 05:33:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k3sm1205972ejd.36.2020.12.02.05.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 05:33:06 -0800 (PST)
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
To: P J P <ppandit@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <a964ffea-ece6-3f33-3dd1-ee9c2b729b75@redhat.com>
 <87sg8o65ys.fsf@dusky.pond.sub.org>
 <212n55r-9n3q-8r4r-85p7-14n495r53s6n@erqung.pbz>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b9550aa3-e575-179c-01f8-f06dcc702a9e@redhat.com>
Date: Wed, 2 Dec 2020 14:33:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <212n55r-9n3q-8r4r-85p7-14n495r53s6n@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 14:17, P J P wrote:
>    Hi,
> 
> [doing a combined reply]
> 
> +-- On Tue, 1 Dec 2020, Philippe Mathieu-DaudÃ© wrote --+
> | Is it possible to release the reproducer to the community, so we can work on
> | a fix and test it?
> 
> * No, we can not release/share reproducers on a public list.

We do not need researchers to release or share reproducers though, we 
"only" encourage people who contribute bugfixes (esp. for 
security-sensitive issues) to add a qtest testcase.  Often the testcase 
would have no resemblance to the original reproducer (or even always, 
except for fuzzed issues).

Would that be allowed?  If not, we have a problem, because it means we 
cannot follow the basic principle of regression testing.

> * I've been doing the patch work out of my own interest.

Ok, that at least wasn't clear to me.  Thanks for making it clearer.

Paolo


