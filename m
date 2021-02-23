Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AA5322C8E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:40:40 +0100 (CET)
Received: from localhost ([::1]:38968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYre-0008QC-M2
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEYqI-0007eS-Rt
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:39:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEYpp-0006XJ-8u
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+x/LEPV/XORA9qZlO3w067t0CnWO+QhCe3AZ4Aixds4=;
 b=VD+l7FPInCm5d6bV3X/eWVzhp6rnpPY7oNB73pQMyp5pSl3XcUQrexbxfAO5KjmJcjEYFm
 5wSok8qEAR2Bt0zYgh0HqLN68e+2CnConcJFoLPEf819Rct5kBqHITu5PkheBI4EhKeXa8
 n7oUhw8Zusuu72ErHStxpT2p15scIhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-ei_CeNCMOLGczgd3GDNn6w-1; Tue, 23 Feb 2021 09:38:41 -0500
X-MC-Unique: ei_CeNCMOLGczgd3GDNn6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0218B801988;
 Tue, 23 Feb 2021 14:38:40 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA91219C95;
 Tue, 23 Feb 2021 14:38:33 +0000 (UTC)
Subject: Re: [PATCH 1/3] scripts/ci/gitlab-pipeline-status: split utlity
 function for HTTP GET
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210222193240.921250-1-crosa@redhat.com>
 <20210222193240.921250-2-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <fe8f495c-fdf3-b6c0-ef70-8f4b46bce9db@redhat.com>
Date: Tue, 23 Feb 2021 11:38:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222193240.921250-2-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/22/21 4:32 PM, Cleber Rosa wrote:
> This simply splits out the code that does an HTTP GET so that it
> can be used for other API requests.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   scripts/ci/gitlab-pipeline-status | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)

Only fix the "utlity" typo in $SUBJECT:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeline-status
> index 78e72f6008..0c1e8bd8a7 100755
> --- a/scripts/ci/gitlab-pipeline-status
> +++ b/scripts/ci/gitlab-pipeline-status
> @@ -48,18 +48,25 @@ def get_local_branch_commit(branch):
>       return result
>   
>   
> -def get_pipeline_status(project_id, commit_sha1):
> +def get_json_http_response(url):
>       """
> -    Returns the JSON content of the pipeline status API response
> +    Returns the JSON content of an HTTP GET request to gitlab.com
>       """
> -    url = '/api/v4/projects/{}/pipelines?sha={}'.format(project_id,
> -                                                        commit_sha1)
>       connection = http.client.HTTPSConnection('gitlab.com')
>       connection.request('GET', url=url)
>       response = connection.getresponse()
>       if response.code != http.HTTPStatus.OK:
>           raise CommunicationFailure("Failed to receive a successful response")
> -    json_response = json.loads(response.read())
> +    return json.loads(response.read())
> +
> +
> +def get_pipeline_status(project_id, commit_sha1):
> +    """
> +    Returns the JSON content of the pipeline status API response
> +    """
> +    url = '/api/v4/projects/{}/pipelines?sha={}'.format(project_id,
> +                                                        commit_sha1)
> +    json_response = get_json_http_response(url)
>   
>       # As far as I can tell, there should be only one pipeline for the same
>       # project + commit. If this assumption is false, we can add further


