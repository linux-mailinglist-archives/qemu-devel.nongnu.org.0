Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6822BB7AB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 21:44:23 +0100 (CET)
Received: from localhost ([::1]:32946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDGX-0007ch-Jt
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 15:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kgDFE-0007CA-DE
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 15:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kgDFA-0002r1-7c
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 15:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605904974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0YjGh61Yc9wUEWggwfT9JiJ0m4buS9c6c7oKhQMFRv8=;
 b=iYqZ9ztQwOhalrbdi5Kimn4f/SptCvWSbAsl+PFeolFXZoOdKD1LOF8yJnNeRT9ZGsl/I6
 U3stUrY+gWPVPueEaj6KKp1BZa8cd8L7NPd4vCrAobfFcY0tN5qCqluedbiv2btOoz7Uui
 5N5V7WffhiUzvnUxcMYAiqNJKo0Ww6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-tPq14_s2Mj-8A9igL2cwBg-1; Fri, 20 Nov 2020 15:42:52 -0500
X-MC-Unique: tPq14_s2Mj-8A9igL2cwBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93C9D81440E;
 Fri, 20 Nov 2020 20:42:51 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-143.gru2.redhat.com
 [10.97.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C4245C22B;
 Fri, 20 Nov 2020 20:42:47 +0000 (UTC)
Subject: Re: [PATCH v1 1/6] scripts/ci: clean up default args logic a little
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201117173635.29101-1-alex.bennee@linaro.org>
 <20201117173635.29101-2-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <2b76ef59-a6c4-e613-a0d3-31f4776af472@redhat.com>
Date: Fri, 20 Nov 2020 17:42:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117173635.29101-2-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/17/20 2:36 PM, Alex Bennée wrote:
> This allows us to do:
>
>    ./scripts/ci/gitlab-pipeline-status -w -b HEAD -p 2961854
>
> to check out own pipeline status of a recently pushed branch.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   scripts/ci/gitlab-pipeline-status | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeline-status
> index bac8233079..78e72f6008 100755
> --- a/scripts/ci/gitlab-pipeline-status
> +++ b/scripts/ci/gitlab-pipeline-status
> @@ -31,7 +31,7 @@ class NoPipelineFound(Exception):
>       """Communication is successfull but pipeline is not found."""
>   
>   
> -def get_local_branch_commit(branch='staging'):
> +def get_local_branch_commit(branch):
>       """
>       Returns the commit sha1 for the *local* branch named "staging"


Need to reword the method's docstring.

Otherwise,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>       """
> @@ -126,18 +126,16 @@ def create_parser():
>                           help=('The GitLab project ID. Defaults to the project '
>                                 'for https://gitlab.com/qemu-project/qemu, that '
>                                 'is, "%(default)s"'))
> -    try:
> -        default_commit = get_local_branch_commit()
> -        commit_required = False
> -    except ValueError:
> -        default_commit = ''
> -        commit_required = True
> -    parser.add_argument('-c', '--commit', required=commit_required,
> -                        default=default_commit,
> +    parser.add_argument('-b', '--branch', type=str, default="staging",
> +                        help=('Specify the branch to check. '
> +                              'Use HEAD for your current branch. '
> +                              'Otherwise looks at "%(default)s"'))
> +    parser.add_argument('-c', '--commit',
> +                        default=None,
>                           help=('Look for a pipeline associated with the given '
>                                 'commit.  If one is not explicitly given, the '
> -                              'commit associated with the local branch named '
> -                              '"staging" is used.  Default: %(default)s'))
> +                              'commit associated with the default branch '
> +                              'is used.'))
>       parser.add_argument('--verbose', action='store_true', default=False,
>                           help=('A minimal verbosity level that prints the '
>                                 'overall result of the check/wait'))
> @@ -149,6 +147,10 @@ def main():
>       """
>       parser = create_parser()
>       args = parser.parse_args()
> +
> +    if not args.commit:
> +        args.commit = get_local_branch_commit(args.branch)
> +
>       success = False
>       try:
>           if args.wait:


