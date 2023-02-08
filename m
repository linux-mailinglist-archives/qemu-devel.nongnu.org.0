Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7305B68F47E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:27:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoDv-0006kT-Qf; Wed, 08 Feb 2023 12:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPoDu-0006k5-Gl
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPoDs-00016x-KU
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675877227;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xV6IRdIhXmKXxfveqpIfUSpNncz7gB0RVEcmrWOo6Vs=;
 b=NdIJVIogdXCO9N6F+euiLEQIh8jNPvoz1rEQ5W1Jq9R0ZVdfhTbqjO19AM5WtNOgVsuAnC
 3UwxYA8hu84rhrj9MD0j3rROqnddK8te+khYe8DHEcLoPmcDEmYsDpQWYaASCbVXc5K+qr
 ktXvpoYB7pAO6hDDXXazrg0xvISQpn0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-mfZGYvw0O_ysCI1yrQvUHg-1; Wed, 08 Feb 2023 12:27:05 -0500
X-MC-Unique: mfZGYvw0O_ysCI1yrQvUHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6299138173D1;
 Wed,  8 Feb 2023 17:27:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B025FC15BAE;
 Wed,  8 Feb 2023 17:27:04 +0000 (UTC)
Date: Wed, 8 Feb 2023 17:27:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 2/4] lcitool: use libvirt-ci as library
Message-ID: <Y+PbZWwG+n20ODcg@redhat.com>
References: <20230117091638.50523-1-pbonzini@redhat.com>
 <20230117091638.50523-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117091638.50523-3-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 17, 2023 at 10:16:36AM +0100, Paolo Bonzini wrote:
> Using the lcitool package as a library will make it possible to
> customize more of the process, for example by introducing custom
> mappings.

I wouldn't consider the lcitool python code to be a public
library API, which is for example, why its not a published
pakage on pypi.  So from that POV I'm really not a fan of
this change to use the internal APIs directly, as it means
that any contributors who want to update the submodule are
liable to get hit by incompatible API changes.

> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index ee55ee40ee5d..31a34dce7a33 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -12,61 +12,80 @@
>  # or (at your option) any later version. See the COPYING file in
>  # the top-level directory.
>  
> -import sys
> -import subprocess
> -
> +from contextlib import contextmanager
>  from pathlib import Path
>  
> +import sys
> +
>  if len(sys.argv) != 1:
>      print("syntax: %s" % sys.argv[0], file=sys.stderr)
>      sys.exit(1)
>  
> -self_dir = Path(__file__).parent
> -src_dir = self_dir.parent.parent
> +script = Path(__file__)
> +script_dir = script.parent
> +src_dir = script_dir.parent.parent
>  dockerfiles_dir = Path(src_dir, "tests", "docker", "dockerfiles")
>  
> -lcitool_path = Path(self_dir, "libvirt-ci", "bin", "lcitool")
> +sys.path.append(str(Path(script_dir, "libvirt-ci")))
>  
> -lcitool_cmd = [lcitool_path, "--data-dir", self_dir]
> +from lcitool import LcitoolError
> +from lcitool.packages import Packages
> +from lcitool.projects import Projects
> +from lcitool.targets import BuildTarget, Targets
> +from lcitool.formatters import DockerfileFormatter, ShellVariablesFormatter
> +from lcitool.util import DataDir
> +
> +PREFIX = ''
> +
> +DATA_DIR = DataDir(script_dir)
> +PROJECTS = Projects(DATA_DIR)
> +PACKAGES = Packages()
> +TARGETS = Targets()
>  
>  
> -def atomic_write(filename, content):
> +@contextmanager
> +def atomic_write(filename):
>      tmp = filename.with_suffix(filename.suffix + ".tmp")
>      try:
>          with tmp.open("w") as fp:
> -            print(content, file=fp, end="")
> +            yield fp
>              tmp.rename(filename)
> -    except Exception as ex:
> +    except Exception:
>          tmp.unlink()
>          raise
>  
>  
> -def generate(filename, cmd, trailer):
> -    print("Generate %s" % filename)
> -    lcitool = subprocess.run(cmd, capture_output=True)
> -
> -    if lcitool.returncode != 0:
> -        raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
> -
> -    content = lcitool.stdout.decode("utf8")
> -    if trailer is not None:
> -        content += trailer
> -    atomic_write(filename, content)
> +@contextmanager
> +def generate(filename):
> +    print("Generating %s" % filename)
> +    nonlocal PREFIX
> +    try:
> +        PREFIX = "Failed to generate %s: " % filename
> +        with atomic_write(filename) as fp:
> +            print('# THIS FILE WAS AUTO-GENERATED BY',
> +                  script.relative_to(src_dir), file=fp)
> +            print(file=fp)
> +            yield fp
> +    finally:
> +        PREFIX = ''
>  
>  
>  def generate_dockerfile(host, target, cross=None, trailer=None):
>      filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
> -    cmd = lcitool_cmd + ["dockerfile"]
> -    if cross is not None:
> -        cmd.extend(["--cross", cross])
> -    cmd.extend([target, "qemu"])
> -    generate(filename, cmd, trailer)
> +    with generate(filename) as fp:
> +        dockerfile = DockerfileFormatter(PROJECTS)
> +        target = BuildTarget(TARGETS, PACKAGES, target, cross)
> +        print(dockerfile.format(target, ["qemu"]), file=fp)
> +        if trailer is not None:
> +            print(trailer, file=fp, end="")
>  
>  
> -def generate_cirrus(target, trailer=None):
> +def generate_cirrus(target):
>      filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
> -    cmd = lcitool_cmd + ["variables", target, "qemu"]
> -    generate(filename, cmd, trailer)
> +    with generate(filename) as fp:
> +        variables = ShellVariablesFormatter(PROJECTS)
> +        target = BuildTarget(TARGETS, PACKAGES, target)
> +        print(variables.format(target, ["qemu"]), file=fp)
>  
>  
>  ubuntu2004_tsanhack = [
> @@ -98,11 +117,11 @@ def cross_build(prefix, targets):
>      targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
>      return "".join([conf, targets])
>  
> +
>  #
>  # Update all the various build configurations.
>  # Please keep each group sorted alphabetically for easy reading.
>  #
> -
>  try:
>      #
>      # Standard native builds
> @@ -179,6 +198,6 @@ try:
>      generate_cirrus("macos-12")
>  
>      sys.exit(0)
> -except Exception as ex:
> -    print(str(ex), file=sys.stderr)
> +except LcitoolError as ex:
> +    print(PREFIX + ex.module_prefix + " error: " + str(ex), file=sys.stderr)
>      sys.exit(1)
> -- 
> 2.38.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


