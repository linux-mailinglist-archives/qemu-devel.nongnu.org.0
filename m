Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8119575730
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 23:47:46 +0200 (CEST)
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC6gT-0003Dd-GZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 17:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oC6f9-0001mv-Rj
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 17:46:23 -0400
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227]:41015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oC6f7-0007Uu-Df
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 17:46:23 -0400
Received: (Authenticated sender: no-reply@qemu.org)
 by mail.gandi.net (Postfix) with ESMTPSA id D955620008
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 21:46:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: GitLab Bot <no-reply@qemu.org>
To: <qemu-devel@nongnu.org>
Subject: [python-qemu-qmp MR #8] Add git-based package versions, publishing
 scripts, and dev package builds
Date: Thu, 14 Jul 2022 21:46:14 -0000
Message-ID: <165783517413.32561.15766531411067443626.no-reply@qemu.org>
X-GitLab-MergeRequest-ID: 165964011
X-GitLab-Project-Id: 35575318
X-GitLab-Project-Path: qemu-project/python-qemu-qmp
X-GitLab-Project: python-qemu-qmp
X-QEMU-GitLab-MR-IID: 8
X-QEMU-GitLab-MR-URL: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/8
X-QEMU-GitLab-Username: jsnow
Received-SPF: pass client-ip=2001:4b98:dc4:8::227;
 envelope-from=no-reply@qemu.org; helo=relay7-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Author: John Snow - https://gitlab.com/jsnow
Merge Request: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/8
... from: jsnow/python-qemu-qmp:packaging
... into: qemu-project/python-qemu-qmp:main

This is all about streamlining the process of tagging, building, and publishing. The script authored here, `publish.py`, is designed to make the publishing process fool-resistant by providing a slew of smoke tests designed to prevent erroneous, premature, or inconsistent releases.

A note:
- Before this is merged, I will want to tag 765e2e210dcbf975f93d1b142761651e61772da6 as "v0.0.0a1" on origin/main so that the dev package build that will be incurred after the merge is accepted will have an appropriate version (v0.0.0a2.devNN+09abcdef). I didn't do it yet so that there can be feedback on this scheme first, in case. I do not want to ever delete a tag from `origin/main` in keeping with the principle that git commit history should never change.

The intended release process is expected to be something like this:

1. An MR is submitted that updates the README with new changelog info, any last touchups, etc. The MR makes it clear to reviewer(s) that a new version will be published contingent on review, successful pipelines, etc.
2. MR is approved and merged. Pipelines run and pass.
3. A maintainer (me) runs `python3 publish.py tag` from my local repo and assigns a new version number. The annotated tag is pushed to origin.
4. Maintainer runs `python3 publish.py build` to create new distribution files on their local machine.
5. Maintainer runs `python3 publish.py publish --test` as a dry run to push a new package version to `test.pypi.org`. Maintainer inspects that it appears to have worked correctly (readme looks right, metadata appears to render correctly, etc) and all pieces appear to be in place.
6. Maintainer runs `python3 publish.py publish` to finalize the submission to PyPI.

The authentication for the publish script is provided by the environment variable `TWINE_PASSWORD`, which takes the form of a PyPI authorization token. It would also be possible to utilize keyring support, but I didn't leap that far ahead yet.

Each version tag is designed to be signed and annotated. Each distribution file uploaded to PyPI is also designed to be signed. At present I am just using my own personal key, but I could look into creating a generic "QEMU project python release" key for the purpose, if requested. (Please suggest key creation parameters in this case.)

LASTLY, I intend to - after this series is merged - send a followup MR to indicate the v0.0.1 release, and then test the process by tagging and releasing v0.0.1. See milestone %"v0.0.1 (First release)" 

See the commit messages on each change attached here for additional information, notes, musings, poetry, etc.

Closes #16

---

This is an automated message. This bot will only relay the creation of new merge
requests and will not relay review comments, new revisions, or concluded merges.
Please follow the GitLab link to participate in review.

