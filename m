Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D8869DE3C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:53:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQFv-0005JE-6Z; Tue, 21 Feb 2023 05:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUQFq-0005IQ-FO
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:52:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUQFo-00033P-P1
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676976731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWL5GfTkzBTtpgCXMu9nhqTyiCpZp2cXDMITN11zRrc=;
 b=XuKG7iIMzcGeNI4Doa3qe4dz9IefrhpJvHvWX43bk1/ZtnBTnCw7ypsok2iaLukh8iA42x
 DnJbQsk9hlnqwguauiiBj1cHDkyecnXqUoCOLlRlbvW3KnfDfa7PXl19nKexSmOdN7+kAP
 MyMeWpV/euQbv+AN3/S2V5zuoXK1ztg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-99--aliEd-hNbKziAmerPuwAw-1; Tue, 21 Feb 2023 05:52:09 -0500
X-MC-Unique: -aliEd-hNbKziAmerPuwAw-1
Received: by mail-wr1-f70.google.com with SMTP id
 g6-20020adfa486000000b002c55ef1ec94so718610wrb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jWL5GfTkzBTtpgCXMu9nhqTyiCpZp2cXDMITN11zRrc=;
 b=TLXYVJX6JPihGEAfya3kTjlhSo7ur5RgaYyi6jXsrbiiHuwrC2NIpNzggNFWbObunN
 PvqsJM1ETuPU80SQdvWxmtWzfjhR915I3XUNY52moThD5MTZO/253Y5n6IYktDd0OmTF
 OSnlyhseSHCIR2MOP+5Om+qKh5PUrwot3ybJc5+Ui3BSU2/SDVKrir5MG5hp+OaRwaL3
 gX1+CwBydqKx9bqnVER8Zd7ag0a/uA/gbDzIpkabuuSxGYteB23VX79tDHnWCMFua1xC
 QGDasz7BJqVXV0nKrmeYrUJlBJJqWRrigTR+ptKIh7aBe3yrFQoKiKFfPkXcPHKE+eMu
 AfUA==
X-Gm-Message-State: AO0yUKWUGCNlZjPeSpS4/qUv3pH3iAXb7DkMgloFibMrnXkPt9oNefbT
 xgXD8c8079Eq7mKnADOFRCpnsZp/1J83Qpt+GmVDA4QLilq9UgKW1Dh/IFV7ZBU+4yTS6kz8C3s
 SqsN10vH61qHazig=
X-Received: by 2002:a05:600c:4a98:b0:3e2:59d:432c with SMTP id
 b24-20020a05600c4a9800b003e2059d432cmr2714506wmp.17.1676976728329; 
 Tue, 21 Feb 2023 02:52:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/VxnpqCJbsXgDxDY3z7fE+OH/lEzFtv9JEHWEqBHmAoONOa4oqHhijD6Z+fb3eHSTd2Eq3Sw==
X-Received: by 2002:a05:600c:4a98:b0:3e2:59d:432c with SMTP id
 b24-20020a05600c4a9800b003e2059d432cmr2714479wmp.17.1676976728061; 
 Tue, 21 Feb 2023 02:52:08 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c274100b003dfe549da4fsm4771613wmw.18.2023.02.21.02.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:52:06 -0800 (PST)
Message-ID: <d47fa98e-ea72-d922-03b9-0cfbc045ca4e@redhat.com>
Date: Tue, 21 Feb 2023 11:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 07/14] gitlab: extend custom runners with
 base_job_template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alexander Bulekov
 <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/02/2023 10.45, Alex Bennée wrote:
> The base job template is responsible for controlling how we kick off
> testing on our various branches. Rename and extend the
> custom_runner_template so we can take advantage of all that control.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml                      |  3 ++-
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml   | 10 +++++-----
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml |  2 +-
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 10 +++++-----
>   4 files changed, 13 insertions(+), 12 deletions(-)

 From v1:
Reviewed-by: Thomas Huth <thuth@redhat.com>


